-- format_time_theorems.lean
-- Formal proof of advance_homomorphism for format_time
-- Source: github.com/ProphetGang/format_time (MIT)
-- Mission: MISSION-FORMAT-TIME-LEAN-PROOF
-- Verified: lake env lean lean/format_time_theorems.lean
--
-- Mathlib is available (lakefile.lean requires mathlib).
-- This file imports only what is needed.

import Mathlib.Data.Nat.Basic
import Mathlib.Tactic.LinearCombination

-- ─────────────────────────────────────────────────────────────────────────────
-- Types (mirror format_time Time class and ParametersManager)
-- ─────────────────────────────────────────────────────────────────────────────

structure TimeParams where
  tph : Nat  -- ticks_per_hour
  hpd : Nat  -- hours_per_day
  dpm : Nat  -- days_per_month
  mpy : Nat  -- months_per_year

@[ext]
structure TimeState where
  tick  : Nat
  hour  : Nat
  day   : Nat
  month : Nat
  year  : Nat

-- ─────────────────────────────────────────────────────────────────────────────
-- total_ticks: bijection from TimeState to absolute tick count
-- ─────────────────────────────────────────────────────────────────────────────

def total_ticks (p : TimeParams) (s : TimeState) : Nat :=
  s.tick +
  s.hour  * p.tph +
  s.day   * (p.hpd * p.tph) +
  s.month * (p.dpm * p.hpd * p.tph) +
  s.year  * (p.mpy * p.dpm * p.hpd * p.tph)

-- ─────────────────────────────────────────────────────────────────────────────
-- advance: mirrors format_time Time.advance() divmod carry chain
-- source: time_engine/time.py lines 63-100
-- ─────────────────────────────────────────────────────────────────────────────

def advance (p : TimeParams) (s : TimeState) (n : Nat) : TimeState :=
  let t0      := s.tick + n
  let tick'   := t0 % p.tph
  let h_carry := t0 / p.tph
  let t1      := s.hour + h_carry
  let hour'   := t1 % p.hpd
  let d_carry := t1 / p.hpd
  let t2      := s.day + d_carry
  let day'    := t2 % p.dpm
  let m_carry := t2 / p.dpm
  let t3      := s.month + m_carry
  let month'  := t3 % p.mpy
  let y_carry := t3 / p.mpy
  let year'   := s.year + y_carry
  ⟨tick', hour', day', month', year'⟩

-- ─────────────────────────────────────────────────────────────────────────────
-- Core lemma: total_ticks is preserved under advance modulo addition
-- ─────────────────────────────────────────────────────────────────────────────

theorem total_ticks_advance (p : TimeParams) (s : TimeState) (n : Nat) :
    total_ticks p (advance p s n) = total_ticks p s + n := by
  simp only [total_ticks, advance]
  set t0 := s.tick + n
  set t1 := s.hour + t0 / p.tph
  set t2 := s.day  + t1 / p.hpd
  set t3 := s.month + t2 / p.dpm
  -- Nat.div_add_mod : k * (m / k) + m % k = m
  have e0 : p.tph * (t0 / p.tph) + t0 % p.tph = t0 := Nat.div_add_mod t0 p.tph
  have e1 : p.hpd * (t1 / p.hpd) + t1 % p.hpd = t1 := Nat.div_add_mod t1 p.hpd
  have e2 : p.dpm * (t2 / p.dpm) + t2 % p.dpm = t2 := Nat.div_add_mod t2 p.dpm
  have e3 : p.mpy * (t3 / p.mpy) + t3 % p.mpy = t3 := Nat.div_add_mod t3 p.mpy
  linear_combination e0 + e1 * p.tph + e2 * (p.hpd * p.tph) + e3 * (p.dpm * p.hpd * p.tph)

-- ─────────────────────────────────────────────────────────────────────────────
-- carry_split: (m + n) / k = m / k + (m % k + n) / k
-- This is the key identity that links the carry chain to canonical divmod.
-- Proof: case split on k = 0 vs k > 0.
--   k = 0: both sides 0 (n / 0 = 0 in Lean 4).
--   k > 0: m = k*(m/k) + m%k, so m+n = k*(m/k) + (m%k+n),
--           divide both sides by k using Nat.add_mul_div_right.
-- ─────────────────────────────────────────────────────────────────────────────

lemma carry_split (m n k : Nat) : (m + n) / k = m / k + (m % k + n) / k := by
  rcases Nat.eq_zero_or_pos k with rfl | hk
  · simp
  · conv_lhs => rw [← Nat.div_add_mod m k]
    rw [show k * (m / k) + m % k + n = (m % k + n) + k * (m / k) from by ring]
    rw [Nat.add_mul_div_right _ _ hk]

-- ─────────────────────────────────────────────────────────────────────────────
-- mod_step: (m % k + n) % k = (m + n) % k
-- Follows directly from Nat.add_mod.
-- ─────────────────────────────────────────────────────────────────────────────

lemma mod_step (m n k : Nat) : (m % k + n) % k = (m + n) % k :=
  (Nat.add_mod m n k).symm

-- ─────────────────────────────────────────────────────────────────────────────
-- advance_homomorphism
--
-- advance p (advance p s a) b = advance p s (a + b)
--
-- Proof: field by field. At each level:
--   tick:  ((s.tick+a)%tph + b) % tph = (s.tick+a+b) % tph        [mod_step]
--   hour:  outer carry = (s.tick+a)%tph+b)/tph                     [definition]
--          (s.tick+a+b)/tph = (s.tick+a)/tph + ((s.tick+a)%tph+b)/tph  [carry_split]
--          ((hour_a)%hpd + outer_h_carry) % hpd = (hour_a + outer_h_carry) % hpd [mod_step]
--   day, month, year: same pattern at each carry level.
-- ─────────────────────────────────────────────────────────────────────────────

theorem advance_homomorphism (p : TimeParams) (s : TimeState) (a b : Nat) :
    advance p (advance p s a) b = advance p s (a + b) := by
  simp only [advance]
  -- Name the inner carries from advance(s, a)
  set ta0 := s.tick + a         with hta0
  set ta1 := s.hour + ta0 / p.tph
  set ta2 := s.day  + ta1 / p.hpd
  set ta3 := s.month + ta2 / p.dpm
  -- The outer advance sees: s2.tick = ta0 % tph, s2.hour = ta1 % hpd, etc.
  -- Name the outer carry-in for tick: tick_a + b
  set tb0 := ta0 % p.tph + b
  set tb1 := ta1 % p.hpd + tb0 / p.tph
  set tb2 := ta2 % p.dpm + tb1 / p.hpd
  set tb3 := ta3 % p.mpy + tb2 / p.dpm
  -- Name the single-step carries for advance(s, a+b)
  set tc0 := s.tick + (a + b)   with htc0
  set tc1 := s.hour + tc0 / p.tph
  set tc2 := s.day  + tc1 / p.hpd
  set tc3 := s.month + tc2 / p.dpm
  -- Key: tc0 = ta0 + b, so carries telescope via carry_split
  have htc0_eq : tc0 = ta0 + b := by simp [htc0, hta0]; ring
  -- Carry split at tick level: (ta0 + b) / tph = ta0/tph + (ta0%tph + b)/tph
  have hc0 : tc0 / p.tph = ta0 / p.tph + tb0 / p.tph := by
    rw [htc0_eq]; exact carry_split ta0 b p.tph
  -- tc1 = ta1 + tb0/tph
  have htc1 : tc1 = ta1 + tb0 / p.tph := by simp [tc1, tc0, ta1, hc0]; ring
  -- Carry split at hour level
  have hc1 : tc1 / p.hpd = ta1 / p.hpd + tb1 / p.hpd := by
    rw [htc1]; exact carry_split ta1 (tb0 / p.tph) p.hpd
  -- tc2 = ta2 + tb1/hpd
  have htc2 : tc2 = ta2 + tb1 / p.hpd := by simp [tc2, tc1, ta2, hc1]; ring
  -- Carry split at day level
  have hc2 : tc2 / p.dpm = ta2 / p.dpm + tb2 / p.dpm := by
    rw [htc2]; exact carry_split ta2 (tb1 / p.hpd) p.dpm
  -- tc3 = ta3 + tb2/dpm
  have htc3 : tc3 = ta3 + tb2 / p.dpm := by simp [tc3, tc2, ta3, hc2]; ring
  -- Carry split at month level
  have hc3 : tc3 / p.mpy = ta3 / p.mpy + tb3 / p.mpy := by
    rw [htc3]; exact carry_split ta3 (tb2 / p.dpm) p.mpy
  ext <;> simp only
  · -- tick: tb0 % tph = tc0 % tph
    rw [htc0_eq]; exact (mod_step ta0 b p.tph).symm
  · -- hour: tb1 % hpd = tc1 % hpd
    rw [htc1]; exact (mod_step ta1 (tb0 / p.tph) p.hpd).symm
  · -- day: tb2 % dpm = tc2 % dpm
    rw [htc2]; exact (mod_step ta2 (tb1 / p.hpd) p.dpm).symm
  · -- month: tb3 % mpy = tc3 % mpy
    rw [htc3]; exact (mod_step ta3 (tb2 / p.dpm) p.mpy).symm
  · -- year: (ta3 % mpy / mpy is 0 since x%k < k) ... + tb3/mpy = tc3/mpy
    -- LHS year: (s.year + ta3/mpy) + tb3/mpy
    -- RHS year: s.year + tc3/mpy
    rw [htc3, hc3]; ring
