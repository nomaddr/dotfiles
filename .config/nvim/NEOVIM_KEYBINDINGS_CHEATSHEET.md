# 🚀 Neovim Keybindings Cheatsheet

> **Leader Key:** `<Space>` (Space bar)  
> **Note:** `<C-x>` = Ctrl+x, `<A-x>` = Alt+x, `<S-x>` = Shift+x

---

## 🔧 **CORE NAVIGATION & EDITING**

### **Basic Movement**
| Key | Action | Mode |
|-----|--------|------|
| `h/j/k/l` | Left/Down/Up/Right | Normal |
| `w/b` | Next/Previous word | Normal |
| `0/$` | Start/End of line | Normal |
| `gg/G` | Top/Bottom of file | Normal |
| `<C-u>/<C-d>` | Half page up/down | Normal |
| `<C-o>/<C-i>` | Jump back/forward | Normal |

### **Window Navigation (Tmux Integration)**
| Key | Action | Mode |
|-----|--------|------|
| `<C-h>` | Move to left window | Normal |
| `<C-l>` | Move to right window | Normal |
| `<C-j>` | Move to window below | Normal |
| `<C-k>` | Move to window above | Normal |
| `<C-w>s` | Split horizontal | Normal |
| `<C-w>v` | Split vertical | Normal |
| `<C-w>q` | Close window | Normal |

### **Basic Editing**
| Key | Action | Mode |
|-----|--------|------|
| `i/a` | Insert before/after cursor | Normal |
| `I/A` | Insert at start/end of line | Normal |
| `o/O` | New line below/above | Normal |
| `x/X` | Delete char after/before cursor | Normal |
| `dd` | Delete line | Normal |
| `yy` | Copy line | Normal |
| `p/P` | Paste after/before cursor | Normal |
| `u/<C-r>` | Undo/Redo | Normal |

---

## 🔍 **SEARCH & NAVIGATION (Telescope)**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ff` | Find Files | Search files in project |
| `<leader>fg` | Live Grep | Search text in files |
| `<leader>fb` | Buffers | Switch between open buffers |
| `<leader>fh` | Help Tags | Search help documentation |
| `<leader>fr` | Recent Files | Recently opened files |
| `<leader>fc` | Commands | Search available commands |
| `<leader>fk` | Keymaps | Search keybindings |
| `<leader>fs` | Symbols | Search document symbols |
| `<leader>fw` | Word under cursor | Search current word |

---

## 📁 **FILE EXPLORER (Neo-tree)**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle Explorer | Open/close file tree |
| `<leader>E` | Explorer Focus | Focus on file tree |
| `a` | Add file/folder | Create new (in tree) |
| `d` | Delete | Delete file/folder |
| `r` | Rename | Rename file/folder |
| `c` | Copy | Copy file/folder |
| `x` | Cut | Cut file/folder |
| `p` | Paste | Paste file/folder |

---

## 🔧 **LSP & CODE INTELLIGENCE**

### **Core LSP**
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to Definition | Jump to definition |
| `gr` | References | Find references |
| `gi` | Go to Implementation | Jump to implementation |
| `gt` | Go to Type Definition | Jump to type definition |
| `K` | Hover Documentation | Show documentation |
| `<leader>ca` | Code Actions | Available code actions |
| `<leader>cr` | Rename Symbol | Rename variable/function |
| `<leader>cf` | Format Document | Format current file |
| `<leader>cd` | Diagnostics | Show line diagnostics |

### **Enhanced LSP**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>li` | LSP Info | Show LSP server info |
| `<leader>lr` | LSP Restart | Restart LSP server |
| `<leader>lf` | Format Buffer | Format current buffer |
| `]d/[d` | Next/Previous Diagnostic | Navigate diagnostics |
| `]e/[e` | Next/Previous Error | Navigate errors |

---

## 🐛 **DEBUGGING (DAP)**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>db` | Toggle Breakpoint | Set/remove breakpoint |
| `<leader>dc` | Continue | Continue execution |
| `<leader>da` | Step Over | Step over function |
| `<leader>di` | Step Into | Step into function |
| `<leader>do` | Step Out | Step out of function |
| `<leader>dr` | Open REPL | Debug REPL console |
| `<leader>du` | Toggle DAP UI | Show/hide debug UI |

---

## 🏗️ **CMAKE (C/C++ Projects)**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>cg` | CMake Generate | Generate build files |
| `<leader>cb` | CMake Build | Build project |
| `<leader>cr` | CMake Run | Run executable |
| `<leader>cd` | CMake Debug | Debug executable |
| `<leader>ct` | Select Build Type | Choose Debug/Release |
| `<leader>ck` | Select Kit | Choose compiler kit |

---

## 🌐 **WEB DEVELOPMENT**

### **REST Client**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>rr` | Run REST Request | Execute HTTP request |
| `<leader>rl` | Run Last Request | Repeat last request |

### **Package Management (package.json)**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ns` | Show Package Info | Display package versions |
| `<leader>nc` | Hide Package Info | Hide package info |
| `<leader>nt` | Toggle Package Info | Toggle package display |
| `<leader>nu` | Update Package | Update package version |
| `<leader>nd` | Delete Package | Remove package |
| `<leader>ni` | Install Package | Install new package |
| `<leader>np` | Change Version | Change package version |

### **Live Server**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ls` | Start Live Server | Start development server |
| `<leader>lS` | Stop Live Server | Stop development server |

---

## 📦 **PLUGIN MANAGEMENT**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>pm` | Mason | Open Mason (tool installer) |
| `<leader>pl` | Lazy | Open Lazy (plugin manager) |
| `<leader>pc` | Lazy Clean | Clean unused plugins |
| `<leader>pu` | Lazy Update | Update all plugins |

---

## 🎨 **UI & INTERFACE**

### **Buffers & Tabs**
| Key | Action | Description |
|-----|--------|-------------|
| `<S-h>` | Previous Buffer | Switch to previous buffer |
| `<S-l>` | Next Buffer | Switch to next buffer |
| `<leader>bd` | Delete Buffer | Close current buffer |
| `<leader>bD` | Delete Other Buffers | Close all except current |

### **Terminal**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>tt` | Toggle Terminal | Open/close terminal |
| `<leader>tf` | Float Terminal | Floating terminal |
| `<leader>th` | Horizontal Terminal | Horizontal split terminal |
| `<leader>tv` | Vertical Terminal | Vertical split terminal |

### **Notifications & UI**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>un` | Dismiss Notifications | Clear notifications |
| `<leader>ul` | Toggle Line Numbers | Show/hide line numbers |
| `<leader>ur` | Toggle Relative Numbers | Relative line numbers |
| `<leader>uw` | Toggle Word Wrap | Enable/disable word wrap |

---

## 🔧 **ADVANCED FEATURES**

### **Git Integration**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gg` | Lazygit | Open git interface |
| `<leader>gb` | Git Blame | Show git blame |
| `<leader>gf` | Git Files | Search git files |
| `]h/[h` | Next/Previous Hunk | Navigate git changes |

### **Quick Actions**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>qq` | Quit All | Exit Neovim |
| `<leader>w` | Save File | Write current file |
| `<leader>W` | Save All | Write all files |
| `<leader><leader>` | Find Files | Quick file search |

### **Text Manipulation**
| Key | Action | Description |
|-----|--------|-------------|
| `<A-j>` | Move Line Down | Move current line down |
| `<A-k>` | Move Line Up | Move current line up |
| `<` | Indent Left | Decrease indentation (Visual) |
| `>` | Indent Right | Increase indentation (Visual) |

---

## 🎯 **MODE-SPECIFIC SHORTCUTS**

### **Insert Mode**
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h>` | Delete Backward | Delete previous char |
| `<C-l>` | Delete Forward | Delete next char |
| `<C-j>` | Move Down | Move cursor down |
| `<C-k>` | Move Up | Move cursor up |

### **Visual Mode**
| Key | Action | Description |
|-----|--------|-------------|
| `<` | Indent Left | Decrease indent (stay selected) |
| `>` | Indent Right | Increase indent (stay selected) |
| `J` | Join Lines | Join selected lines |
| `K` | Move Selection Up | Move selected text up |

---

## 💡 **TIPS & TRICKS**

1. **Leader Key Timeout:** Press `<leader>` and wait to see available options
2. **Which-key:** Shows available keybindings when you pause
3. **Telescope:** Use `<C-n>/<C-p>` to navigate results
4. **LSP:** Use `K` twice to enter hover window for scrolling
5. **Terminal:** Use `<C-\><C-n>` to exit terminal mode
6. **Search:** Use `/` for search, `n/N` for next/previous match

---

## 🔍 **HELP & DISCOVERY**

| Key | Action | Description |
|-----|--------|-------------|
| `:help <topic>` | Help | Get help on any topic |
| `:checkhealth` | Health Check | Verify configuration |
| `<leader>fk` | Find Keymaps | Search all keybindings |
| `<leader>fc` | Find Commands | Search available commands |

---

**🎉 Happy Coding!** This cheatsheet covers your complete Neovim setup. Print it out or keep it handy while you learn!