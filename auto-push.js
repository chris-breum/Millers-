import fs from 'fs';
import { spawn } from 'child_process';
import path from 'path';

const projectPath = 'c:\\vue\\Millers';
const excludeDirs = ['node_modules', '.git', 'dist', '.vscode'];
const debounceTime = 3000; // Wait 3 seconds after last change
let timeout = null;

function shouldIgnore(filePath) {
  return excludeDirs.some(dir => filePath.includes(dir));
}

function pushToGithub() {
  console.log(`\n📤 Pushing changes to GitHub...`);
  
  const git = spawn('git', ['add', '.'], { cwd: projectPath });
  
  git.on('close', () => {
    const commit = spawn('git', ['commit', '-m', `Auto-update: ${new Date().toLocaleString()}`], { cwd: projectPath });
    
    commit.on('close', (code) => {
      if (code === 0 || code === 1) { // 0 = success, 1 = no changes
        const push = spawn('git', ['push'], { cwd: projectPath });
        
        push.stdout.on('data', (data) => {
          console.log(`✅ ${data}`);
        });
        
        push.on('close', () => {
          console.log('✅ Changes pushed successfully!');
        });
      }
    });
  });
}

function watchFiles(dirPath) {
  fs.watch(dirPath, { recursive: true }, (eventType, filename) => {
    if (!filename || shouldIgnore(filename)) return;
    
    console.log(`📝 File changed: ${filename}`);
    
    // Clear existing timeout
    clearTimeout(timeout);
    
    // Debounce: wait 3 seconds before pushing
    timeout = setTimeout(() => {
      pushToGithub();
    }, debounceTime);
  });
}

console.log('🚀 Auto-push enabled!');
console.log('📁 Watching:', projectPath);
console.log('⏱️  Will push 3 seconds after last file change\n');

watchFiles(projectPath);
