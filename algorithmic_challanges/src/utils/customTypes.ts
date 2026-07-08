// 1. MyPick: Constructs a type by picking the set of properties K from T
export type MyPick<T, K extends keyof T> = {
  [P in K]: T[P];
};

// 2. MyReadonly: Constructs a type with all properties of T set to readonly
export type MyReadonly<T> = {
  readonly [P in keyof T]: T[P];
};

// 3. MyOmit: Constructs a type by picking all properties from T and then removing K
// First, we need a custom Exclude to filter out the keys
export type MyExclude<T, U> = T extends U ? never : T;

// Then we use MyPick and MyExclude to create MyOmit
// Use PropertyKey instead of `keyof any` to avoid implicit `any` lint warnings
export type MyOmit<T, K extends PropertyKey> = MyPick<T, MyExclude<keyof T, K>>;

// --- DEMONSTRATION INTERFACES ---
export interface Developer {
  id: number;
  name: string;
  role: string;
  experienceYears: number;
}

// We will use these exported types in our UI to prove they work
export type DeveloperNameAndRole = MyPick<Developer, 'name' | 'role'>;
export type ReadonlyDeveloper = MyReadonly<Developer>;
export type DeveloperWithoutId = MyOmit<Developer, 'id'>;