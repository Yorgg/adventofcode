// Day 4
// https://adventofcode.com/2017/day/4/

// Setup
const phrases = input.split('\n');

// helpers
const uniq = a => [...new Set(a)];
const sortStr = s => s.split('').sort().join('');
const hasCorrectChars = a => a.every(word => !!word.match(/[a-z]+/));
const hasUniqueWords  = a => uniq(a).length === a.length;
const hasNoAnnagrams  = a => uniq(a.map(s => sortStr(s))).length === a.length;

// Part 1
phrases.filter(phrase => {
  const words = phrase.split(' ');
  return hasUniqueWords(words) && hasCorrectChars(words);
}).length

// Part 2 
phrases.filter(phrase => {
  const words = phrase.split(' ');
  return hasCorrectChars(words) && hasNoAnnagrams(words) 
  // && hasUniqueWords(words) (unique words already checked in hasNoAnnagrams)
}).length








