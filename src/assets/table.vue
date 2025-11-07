<script setup>
import { ref } from 'vue';

const rows = ref([]);

const addRow = () => {
  rows.value.push({
    cell1: '',
    cell2: '',
    cell3: '',
    cell4: '',
    cell5: '',
    cell6: '',
    cell7: '',
    cell8: '',
  });
};

const deleteRow = (index) => {
  rows.value.splice(index, 1);
};

const isCell1Duplicate = (value, index) => {
  return rows.value.some((row, i) => i !== index && row.cell1 === value && value !== '');
};
</script>

<template>
  <div>
    <table class="min-w-full bg-white border border-gray-600 border-3">

            <tr>
            <th class="py-2 px-4  border-r border-gray-600 text-left w-5/18">sample size s/m</th>
            <th class="py-2 px-4  border-r border-gray-600 border-2 text-left w-1/18">3D</th>
            <th class="py-2 px-4  border-r border-gray-600 border-2 text-left w-3/18">Proto</th>
            <th class="py-2 px-4 border-r border-gray-600 border-2 text-left w-3/18">Sms</th>
            <th class="py-2 px-4  border-r border-gray-600 border-2 border-2 text-left w-3/18">Pps</th>
            <th class="py-2 px-4  border-b border-r border-gray-600 border-2 text-left w-3/18">2nd pps</th>
            <th class="py-2 px-4  border-b border-gray-600 border-2 text-left w-2/18">Final</th>
            </tr>
        </table>
    <table class="min-w-full bg-white border border-gray-600 border-3">
        
        <thead>
        
            <tr>
             <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18"></td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-4/18">Row 1, Cell 1</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 2</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 3</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 4</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 5</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 6</td>
             <td class="py-2 px-4 border-b border-r border-gray-600 w-4/18">Row 1, Cell 1</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 2</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 3</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 4</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 5</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 6</td>
              <td class="py-2 px-4 border-b border-r border-gray-600 w-1/18">Row 1, Cell 6</td>
            <td class="py-2 px-4 border-b border-r border-gray-600 w-2/18">Row 1, Cell 7</td>
            </tr>

        </thead>
        <tbody>
            <tr v-for="(row, index) in rows" :key="index">
              <td class="py-2 px-4 border-b border-r border-gray-600">
                <input 
                  v-model="row.cell1" 
                  :class="['w-full px-2 py-1', isCell1Duplicate(row.cell1, index) ? 'bg-red-100 border border-red-500' : '']"
                />
              </td>
              <td class="py-2 px-4 border-b border-r border-gray-600">
                <input v-model="row.cell2" class="w-full px-2 py-1" />
              </td>
              <td class="py-2 px-4 border-b border-r border-gray-600">
                <input v-model="row.cell3" class="w-full px-2 py-1" />
              </td>
              <td class="py-2 px-4 border-b border-r border-gray-600">
                <input v-model="row.cell4" class="w-full px-2 py-1" />
              </td>
              <td class="py-2 px-4 border-b border-r border-gray-600">
                <input v-model="row.cell5" class="w-full px-2 py-1" />
              </td>
              <td class="py-2 px-4 border-b border-r border-gray-600">
                <input v-model="row.cell6" class="w-full px-2 py-1" />
              </td>
              <td class="py-2 px-4 border-b border-r border-gray-600">
                <input v-model="row.cell7" class="w-full px-2 py-1" />
              </td>
              <td class="py-2 px-4 border-b border-r border-gray-600 flex items-center gap-2">
                <input v-model="row.cell8" class="w-full px-2 py-1" />
                <button @click="deleteRow(index)" class="text-red-500 hover:text-red-700 font-bold">✕</button>
              </td>
            </tr>
        </tbody>
    </table>
    <button @click="addRow" class="mt-4 px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">Click Me</button>
  </div>
</template>
<style scoped></style>