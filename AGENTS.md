# 🚀 Neovim Configuration Handover Document

## 📋 Project Overview

This is a sophisticated **production-ready Neovim configuration** built on **NvChad v2.5**, designed for full-stack development with special focus on **Flutter/Dart**, **Elixir**, and **JavaScript/TypeScript** ecosystems. The configuration uses an **environment-driven architecture** that allows selective feature activation based on developer needs.

## 🎯 Target Audience

- **New team members** needing to quickly onboard
- **DevOps engineers** maintaining CI/CD for this setup
- **Senior developers** extending the configuration
- **Remote developers** working across different environments

## 🏗️ Architecture & Philosophy

### Core Design Principles
- **Environment-Driven**: Features load based on environment variables
- **Modular**: Each plugin has its own configuration file
- **AI-First**: Deep integration with Claude/Copilot for AI-assisted development
- **Flutter-Optimized**: Specialized tools for Flutter development
- **Multi-Language**: Comprehensive support for modern development stacks

### Technology Stack
- **Base**: NvChad v2.5 (uses NvChad as plugin, not fork)
- **Plugin Manager**: Lazy.nvim
- **Config Language**: Lua
- **AI Integration**: Claude API + GitHub Copilot
- **Package Management**: Mason for LSP/formatters/debuggers

## 📁 Project Structure Deep Dive

```
nvim-config/
├── 📋 Configuration Files
│   ├── init.lua              # Main entry (loads env + bootstraps)
│   ├── lua/chadrc.lua       # Theme & NvChad config
│   ├── lua/options.lua      # Editor options overrides
│   ├── lua/mappings.lua     # All key mappings (266 lines)
│   └── lua/utils.lua        # Environment loader & utilities
│
├── 🔧 Plugin Configurations
│   ├── lua/plugins/init.lua     # Plugin declarations & imports
│   ├── lua/configs/            # Individual plugin configs
│   │   ├── avante.lua         # Claude AI integration
│   │   ├── blink_cmp.lua      # Completion engine
│   │   ├── conform.lua        # Formatting rules
│   │   ├── flutter_spec.lua   # Flutter-specific tools
│   │   ├── lspconfig.lua      # Language server setup
│   │   ├── git-signs.lua      # Git integration
│   │   ├── tree-sitter.lua    # Syntax highlighting
│   │   └── [20+ more configs]
│
├── 🧩 Custom Local Plugins (Git-ignored)
│   ├── lua/custom-plugins/nvim-code-eval-plugin/
│   │   ├── init.lua           # Code evaluation system
│   │   ├── evaling.lua        # Evaluation engine
│   │   ├── window.lua         # UI management
│   │   └── settings.lua       # Configuration
│   └── lua/custom-plugins/format_current_lines_ex/
│
├── 📝 Snippets & Templates
│   ├── snippets/
│   │   ├── flutter_snippets/    # 19 Riverpod/Flutter templates
│   │   ├── dart.json            # Dart language snippets
│   │   ├── javascript.json      # JS/React patterns
│   │   ├── elixir.json          # Elixir/Phoenix patterns
│   │   └── sql_all.json         # Database queries
│
└── 🔐 Environment Configuration
    ├── .env.example           # Template for env vars
    ├── .stylua.toml          # Lua formatting rules
    └── lazy-lock.json        # Plugin versions lockfile
```

## 🔑 Environment Variables & Feature Flags

### Critical Environment Variables

Create `.env` file from `.env.example`:

```bash
# AI Integration
ANTHROPIC_API_KEY=sk-ant-...          # Claude API key
COPILOT=true                          # Enable GitHub Copilot

# Language Support
SQLUA=true                           # Enable SQL tools/plugin
PLUGIN_EVAL=false                    # Enable experimental eval plugins

# Development Mode
NVIM_DEV_MODE=true                   # Enable debug logging
```

### Feature Matrix by Environment

| Environment | AI Tools | Flutter | Elixir | SQL | Experimental |
|-------------|----------|---------|--------|-----|--------------|
| Frontend Dev | ✅ | ✅ | ❌ | ❌ | ❌ |
| Backend Dev | ✅ | ❌ | ✅ | ✅ | ❌ |
| Full Stack | ✅ | ✅ | ✅ | ✅ | ✅ |
| Minimal | ❌ | ❌ | ❌ | ❌ | ❌ |

## 🚀 Quick Start Guide

### 1. Initial Setup

```bash
# Clone the repository
git clone <repo-url> ~/.config/nvim

# Install dependencies
winget install BurntSushi.ripgrep.MSVC    # Windows
winget install -e --id=JesseDuffield.lazygit
winget install -e --id zig.zig

# macOS/Linux
brew install ripgrep lazygit zig

# Setup environment
cp .env.example .env
# Edit .env with your API keys and preferences
```

### 2. First Launch

```bash
nvim
# Lazy.nvim will auto-install all plugins
# Wait for installation to complete (may take 5-10 minutes)
# :MasonInstallAll to install language servers
```

### 3. Verify Installation

```bash
# Check plugin status
:Lazy health

# Verify LSP servers
:LspInfo

# Check if AI tools are working
:AvanteAsk "What features are available?"
```

## 🎯 Key Mappings & Workflows

### Daily Development Workflow

#### 1. Project Navigation
```vim
<leader>e       # Toggle file explorer
<leader>ff      # Find files (Telescope)
<leader>fw      # Live grep in project
<leader>fb      # Find buffers
<C-h/j/k/l>     # Navigate splits
```

#### 2. Flutter Development
```vim
<leader>fl      # Flutter run/debug
<leader>fr      # Flutter hot reload
<leader>fa      # Flutter analyze
<leader>ft      # Run tests

# Flutter snippets
# Type 'provider' + Tab = Full provider template
# Type 'consumer' + Tab = Consumer widget
```

#### 3. AI-Assisted Development
```vim
<leader>lQ      # Copy error + open Claude
:AvanteEdit     # AI code editing
:AvanteAsk      # Ask AI questions
<leader>aa      # AI code actions
```

#### 4. Git Integration
```vim
<leader>gs      # Git status
<leader>gd      # Git diff
<leader>gb      # Git blame
[g/]g          # Navigate hunks
<leader>cc      # Commit changes
```

#### 5. Debugging
```vim
<F5>            # Start debugging
<F9>            # Toggle breakpoint
<F10>           # Step over
<F11>           # Step into
<leader>dr      # Debug run
```

### Advanced Workflows

#### Multi-file Editing
```vim
<leader>bC      # Close all buffers except current
<leader>bn      # New buffer with LSP
<C-s>          # Save current buffer
<leader>x       # Close current buffer
```

#### Code Quality
```vim
<leader>lf      # Format file
<leader>la      # Code actions
<leader>lr      # Rename symbol
<leader>ld      # Go to definition
<leader>gr      # References
```

## 🛠️ Plugin Configuration Details

### Critical Plugin Configurations

#### 1. Avante (Claude AI)
**File**: `lua/configs/avante.lua`
- **Purpose**: AI-powered code assistance
- **API**: Uses ANTHROPIC_API_KEY
- **Features**: Code editing, explanations, refactoring
- **Keymaps**: `<leader>lQ`, `:Avante*` commands

#### 2. Flutter Tools
**File**: `lua/configs/flutter_spec.lua`
- **Purpose**: Flutter development environment
- **Features**: Hot reload, device management, widget inspector
- **Dependencies**: Flutter SDK, Dart SDK
- **Commands**: FlutterRun, FlutterHotReload, FlutterLog

#### 3. LSP Configuration
**File**: `lua/configs/lspconfig.lua`
- **Languages**: Dart, TypeScript, JavaScript, Elixir, Python, Go
- **Features**: Auto-completion, diagnostics, formatting
- **Keymaps**: gd (goto def), gr (references), K (hover)

#### 4. Formatting Rules
**File**: `lua/configs/conform.lua`
- **Languages**: Prettier (JS/TS), Black (Python), Stylua (Lua)
- **Triggers**: Auto-format on save
- **Fallback**: LSP formatting if conform fails

### Environment-Specific Configurations

#### 1. SQL Support (SQLUA=true)
- **Plugin**: sqlua.nvim
- **Features**: Database connections, query execution
- **Keymaps**: `<leader>db` for database browser

#### 2. GitHub Copilot (COPILOT=true)
- **Plugin**: copilot.lua
- **Features**: AI code completion
- **Keymaps**: Tab for suggestions, Ctrl+Space for manual trigger

## 🔧 Maintenance & Troubleshooting

### Common Issues & Solutions

#### 1. Plugin Installation Fails
```bash
# Clear lazy cache
rm -rf ~/.local/share/nvim/lazy

# Reinstall from scratch
nvim +Lazy sync
```

#### 2. LSP Not Working
```bash
# Check Mason installations
:Mason
# Install missing LSP servers
:MasonInstall typescript-language-server
```

#### 3. AI Features Not Working
```bash
# Verify environment variables
echo $ANTHROPIC_API_KEY
# Check Avante health
:AvanteHealth
```

#### 4. Flutter Issues
```bash
# Verify Flutter path
which flutter
echo $FLUTTER_ROOT
# Check Flutter doctor
flutter doctor
```

### Performance Optimization

#### 1. Reduce Startup Time
```lua
-- In lua/configs/lazy.lua
{
  defaults = { lazy = true },
  performance = {
    rtp = { disabled_plugins = ["gzip", "zip", "netrwPlugin"] }
  }
}
```

#### 2. Memory Management
```vim
:Lazy profile    # Check plugin performance
:checkhealth     # System health check
```

### Backup & Sync Strategy

#### 1. Essential Files to Backup
```bash
# Core configs
~/.config/nvim/lua/
~/.config/nvim/snippets/
~/.config/nvim/.env

# Not needed (auto-generated)
~/.local/share/nvim/lazy/
~/.config/nvim/lazy-lock.json
```

#### 2. Cross-Machine Sync
```bash
# Export configuration
tar -czf nvim-config.tar.gz ~/.config/nvim/lua/ ~/.config/nvim/snippets/

# Import on new machine
tar -xzf nvim-config.tar.gz -C ~/.config/nvim/
```

## 🎯 Extension Development

### Adding New Plugins

1. **Create Configuration**: `lua/configs/new_plugin.lua`
2. **Add Import**: `lua/plugins/init.lua`
3. **Update Environment**: Add feature flag if needed
4. **Test**: `nvim +Lazy sync`

### Adding New Snippets

1. **Create Snippet File**: `snippets/new_language.json`
2. **Register in package.json**
3. **Test**: Type snippet prefix + Tab

### Custom Plugin Development

1. **Create Directory**: `lua/custom-plugins/plugin-name/`
2. **Add to .gitignore** if needed
3. **Import Conditionally**: Use environment variables
4. **Document**: Add to this handover

## 📊 Language Support Matrix

| Language | LSP | Debugger | Formatter | Snippets | Flutter | Special Features |
|----------|-----|----------|-----------|----------|---------|------------------|
| Dart     | ✅  | ✅       | dartfmt   | ✅       | ✅      | Hot reload, Widget inspector |
| TypeScript | ✅ | ✅ | prettier/eslint | ✅ | ❌ | React/Vue templates |
| JavaScript | ✅ | ✅ | prettier/eslint | ✅ | ❌ | Modern JS patterns |
| Elixir   | ✅  | ✅       | mix format | ✅      | ❌      | Phoenix patterns |
| Python   | ✅  | ✅       | black     | ❌       | ❌      | Debugpy integration |
| Go       | ✅  | ✅       | gofmt     | ❌       | ❌      | Delve debugger |
| SQL      | ✅  | ❌       | sqlfmt    | ✅       | ❌      | Database connections |
| Lua      | ✅  | ❌       | stylua    | ✅       | ❌      | Neovim config langs |

## 🔗 Useful Resources

### Documentation Links
- [NvChad Docs](https://nvchad.com/docs)
- [Lazy.nvim Docs](https://lazy.folke.io/)
- [Mason Package Registry](https://github.com/mason-org/mason-registry)
- [Flutter Tools Docs](https://github.com/akinsho/flutter-tools.nvim)
- [Avante AI Docs](https://github.com/yetone/avante.nvim)

### Community & Support
- **Discord**: NvChad Discord server
- **Reddit**: r/neovim
- **GitHub Issues**: Project specific issues
- **Local**: Custom plugin maintainers

### Development Checklist
- [ ] Environment variables configured
- [ ] All language servers installed
- [ ] Flutter SDK configured
- [ ] AI API keys set up
- [ ] Custom snippets tested
- [ ] Debug workflows verified
- [ ] Git integration working
- [ ] Performance optimized

---

**Last Updated**: January 2026
**Maintainer**: Senior Development Team
**Next Review**: March 2026

**🚨 Critical Note**: This configuration is actively maintained and evolves. Always check the latest `.env.example` for new environment variables and feature flags.
