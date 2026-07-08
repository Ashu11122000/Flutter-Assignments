// 1. Reverse a String
export const reverseString = (str: string): string => {
  return str.split('').reverse().join('');
};

// 2. Find Maximum Number (Using an algorithmic loop rather than Math.max for practice)
export const findMaxNumber = (arr: number[]): number | null => {
  if (arr.length === 0) return null;
  
  let max = arr[0];
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] > max) {
      max = arr[i];
    }
  }
  return max;
};

// 3. Prime-Checking
export const isPrime = (num: number): boolean => {
  if (num <= 1) return false;
  if (num <= 3) return true;
  if (num % 2 === 0 || num % 3 === 0) return false;
  
  for (let i = 5; i * i <= num; i += 6) {
    if (num % i === 0 || num % (i + 2) === 0) return false;
  }
  return true;
};