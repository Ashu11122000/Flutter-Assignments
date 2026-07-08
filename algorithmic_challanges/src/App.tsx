import { useState } from 'react';
import { reverseString, findMaxNumber, isPrime } from './utils/algorithm';
import type { Developer, DeveloperNameAndRole, DeveloperWithoutId } from './utils/customTypes';

function App() {
  // Algorithm State
  const [stringInput, setStringInput] = useState<string>('TypeScript');
  const [arrayInput, setArrayInput] = useState<string>('10, 5, 100, 42');
  const [numberInput, setNumberInput] = useState<number>(17);

  // Type Showcase Data (Hover over these variables in your IDE to see the custom types in action!)
  const fullDev: Developer = { id: 1, name: 'Alice', role: 'Frontend', experienceYears: 3 };
  const pickedDev: DeveloperNameAndRole = { name: 'Alice', role: 'Frontend' };
  const omittedDev: DeveloperWithoutId = { name: 'Alice', role: 'Frontend', experienceYears: 3 };

  // Parse the array input safely
  const parsedArray = arrayInput.split(',').map(n => parseInt(n.trim())).filter(n => !isNaN(n));

  return (
    <div className="min-h-screen bg-gray-100 p-8">
      <div className="max-w-4xl mx-auto space-y-8">
        
        <header className="text-center mb-12">
          <h1 className="text-4xl font-bold text-blue-600">TypeScript Sandbox</h1>
          <p className="text-gray-600 mt-2">Type Transformations & Algorithms</p>
        </header>

        {/* --- ASSIGNMENT 1: ALGORITHMS --- */}
        <section className="bg-white rounded-xl shadow-md p-6">
          <h2 className="text-2xl font-semibold mb-6 border-b pb-2">Algorithm Challenges</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {/* Reverse String */}
            <div className="p-4 bg-blue-50 rounded-lg border border-blue-100">
              <h3 className="font-bold text-blue-800 mb-2">Reverse String</h3>
              <input 
                type="text" 
                value={stringInput}
                onChange={(e) => setStringInput(e.target.value)}
                className="w-full p-2 border rounded mb-2 focus:ring-2 focus:ring-blue-400 outline-none"
              />
              <p className="font-mono bg-white p-2 rounded border">Result: {reverseString(stringInput)}</p>
            </div>

            {/* Find Max */}
            <div className="p-4 bg-green-50 rounded-lg border border-green-100">
              <h3 className="font-bold text-green-800 mb-2">Find Max (comma separated)</h3>
              <input 
                type="text" 
                value={arrayInput}
                onChange={(e) => setArrayInput(e.target.value)}
                className="w-full p-2 border rounded mb-2 focus:ring-2 focus:ring-green-400 outline-none"
              />
              <p className="font-mono bg-white p-2 rounded border">Result: {findMaxNumber(parsedArray) ?? 'None'}</p>
            </div>

            {/* Check Prime */}
            <div className="p-4 bg-purple-50 rounded-lg border border-purple-100">
              <h3 className="font-bold text-purple-800 mb-2">Check Prime</h3>
              <input 
                type="number" 
                value={numberInput}
                onChange={(e) => setNumberInput(parseInt(e.target.value) || 0)}
                className="w-full p-2 border rounded mb-2 focus:ring-2 focus:ring-purple-400 outline-none"
              />
              <p className="font-mono bg-white p-2 rounded border">
                Result: {isPrime(numberInput) ? '✅ Prime' : '❌ Not Prime'}
              </p>
            </div>
          </div>
        </section>

        {/* --- ASSIGNMENT 2: TYPES --- */}
        <section className="bg-white rounded-xl shadow-md p-6">
          <h2 className="text-2xl font-semibold mb-6 border-b pb-2">Type Transformations (Under the Hood)</h2>
          <p className="text-gray-600 mb-4 text-sm">
            These objects are strictly typed using our custom <code className="bg-gray-100 px-1 rounded">MyPick</code>, <code className="bg-gray-100 px-1 rounded">MyReadonly</code>, and <code className="bg-gray-100 px-1 rounded">MyOmit</code> utility types.
          </p>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="p-4 bg-gray-50 rounded-lg border">
              <h3 className="font-bold mb-2">Full Developer</h3>
              <pre className="text-xs font-mono whitespace-pre-wrap">{JSON.stringify(fullDev, null, 2)}</pre>
            </div>
            
            <div className="p-4 bg-gray-50 rounded-lg border">
              <h3 className="font-bold mb-2">MyPick&lt;'name' | 'role'&gt;</h3>
              <pre className="text-xs font-mono whitespace-pre-wrap text-blue-700">{JSON.stringify(pickedDev, null, 2)}</pre>
            </div>
            
            <div className="p-4 bg-gray-50 rounded-lg border">
              <h3 className="font-bold mb-2">MyOmit&lt;'id'&gt;</h3>
              <pre className="text-xs font-mono whitespace-pre-wrap text-purple-700">{JSON.stringify(omittedDev, null, 2)}</pre>
            </div>
          </div>
        </section>

      </div>
    </div>
  );
}

export default App;