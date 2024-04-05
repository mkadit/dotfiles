#compdef mise
_mise() {
  typeset -A opt_args
  local context state line curcontext=$curcontext
  local ret=1

  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (activate) __mise_activate_cmd && ret=0 ;;
        (a|aliases|alias) __mise_alias_cmd && ret=0 ;;
        (asdf) __mise_asdf_cmd && ret=0 ;;
        (bin-paths) __mise_bin_paths_cmd && ret=0 ;;
        (cache) __mise_cache_cmd && ret=0 ;;
        (complete|completions|completion) __mise_completion_cmd && ret=0 ;;
        (cfg|config) __mise_config_cmd && ret=0 ;;
        (current) __mise_current_cmd && ret=0 ;;
        (deactivate) __mise_deactivate_cmd && ret=0 ;;
        (direnv) __mise_direnv_cmd && ret=0 ;;
        (dr|doctor) __mise_doctor_cmd && ret=0 ;;
        (e|env) __mise_env_cmd && ret=0 ;;
        (x|exec) __mise_exec_cmd && ret=0 ;;
        (g|global) __mise_global_cmd && ret=0 ;;
        (hook-env) __mise_hook_env_cmd && ret=0 ;;
        (hook-not-found) __mise_hook_not_found_cmd && ret=0 ;;
        (implode) __mise_implode_cmd && ret=0 ;;
        (i|install) __mise_install_cmd && ret=0 ;;
        (latest) __mise_latest_cmd && ret=0 ;;
        (ln|link) __mise_link_cmd && ret=0 ;;
        (l|local) __mise_local_cmd && ret=0 ;;
        (list|ls) __mise_ls_cmd && ret=0 ;;
        (list-all|list-remote|ls-remote) __mise_ls_remote_cmd && ret=0 ;;
        (outdated) __mise_outdated_cmd && ret=0 ;;
        (p|plugin|plugin-list|plugins) __mise_plugins_cmd && ret=0 ;;
        (prune) __mise_prune_cmd && ret=0 ;;
        (reshim) __mise_reshim_cmd && ret=0 ;;
        (r|run) __mise_run_cmd && ret=0 ;;
        (self-update) __mise_self_update_cmd && ret=0 ;;
        (env-vars|ev|set) __mise_set_cmd && ret=0 ;;
        (settings) __mise_settings_cmd && ret=0 ;;
        (sh|shell) __mise_shell_cmd && ret=0 ;;
        (sync) __mise_sync_cmd && ret=0 ;;
        (t|task|tasks) __mise_tasks_cmd && ret=0 ;;
        (trust) __mise_trust_cmd && ret=0 ;;
        (remove|rm|uninstall) __mise_uninstall_cmd && ret=0 ;;
        (unset) __mise_unset_cmd && ret=0 ;;
        (up|upgrade) __mise_upgrade_cmd && ret=0 ;;
        (usage) __mise_usage_cmd && ret=0 ;;
        (u|use) __mise_use_cmd && ret=0 ;;
        (v|version) __mise_version_cmd && ret=0 ;;
        (w|watch) __mise_watch_cmd && ret=0 ;;
        (where) __mise_where_cmd && ret=0 ;;
        (which) __mise_which_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_activate_cmd] )) ||
__mise_activate_cmd() {
  _arguments -s -S \
    '::shell_type:(bash fish nu xonsh zsh)' \
    '--shims[Use shims instead of modifying PATH]' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_alias_cmd] )) ||
__mise_alias_cmd() {
  _arguments -s -S \
    '(-p --plugin)'{-p,--plugin}'=[filter aliases by plugin]:plugin:__mise_plugins' \
    '--no-header[Don'\''t show table header]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_alias_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (get) __mise_alias_get_cmd && ret=0 ;;
        (list|ls) __mise_alias_ls_cmd && ret=0 ;;
        (add|create|set) __mise_alias_set_cmd && ret=0 ;;
        (del|delete|remove|rm|unset) __mise_alias_unset_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_alias_get_cmd] )) ||
__mise_alias_get_cmd() {
  _arguments -s -S \
    ':plugin:__mise_plugins' \
    ':alias:__mise_aliases' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_alias_ls_cmd] )) ||
__mise_alias_ls_cmd() {
  _arguments -s -S \
    '::plugin:__mise_plugins' \
    '--no-header[Don'\''t show table header]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_alias_set_cmd] )) ||
__mise_alias_set_cmd() {
  _arguments -s -S \
    ':plugin:__mise_plugins' \
    ':alias:__mise_aliases' \
    ':value:' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_alias_unset_cmd] )) ||
__mise_alias_unset_cmd() {
  _arguments -s -S \
    ':plugin:__mise_plugins' \
    ':alias:__mise_aliases' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_asdf_cmd] )) ||
__mise_asdf_cmd() {
  _arguments -s -S \
    '*::args:_cmdambivalent' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_bin_paths_cmd] )) ||
__mise_bin_paths_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_cache_cmd] )) ||
__mise_cache_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_cache_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (c|clean|clear) __mise_cache_clear_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_cache_clear_cmd] )) ||
__mise_cache_clear_cmd() {
  _arguments -s -S \
    '*::plugin:__mise_plugins' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_completion_cmd] )) ||
__mise_completion_cmd() {
  _arguments -s -S \
    '::shell:(bash fish zsh)' \
    '--usage[Always use usage for completions.]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_config_cmd] )) ||
__mise_config_cmd() {
  _arguments -s -S \
    '--no-header[Do not print table header]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_config_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (g|generate) __mise_config_generate_cmd && ret=0 ;;
        (ls) __mise_config_ls_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_config_generate_cmd] )) ||
__mise_config_generate_cmd() {
  _arguments -s -S \
    '(-o --output)'{-o,--output}'=[Output to file instead of stdout]:output:_files' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_config_ls_cmd] )) ||
__mise_config_ls_cmd() {
  _arguments -s -S \
    '--no-header[Do not print table header]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_current_cmd] )) ||
__mise_current_cmd() {
  _arguments -s -S \
    '::plugin:__mise_plugins' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_deactivate_cmd] )) ||
__mise_deactivate_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_direnv_cmd] )) ||
__mise_direnv_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_direnv_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (activate) __mise_direnv_activate_cmd && ret=0 ;;
        (envrc) __mise_direnv_envrc_cmd && ret=0 ;;
        (exec) __mise_direnv_exec_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_direnv_activate_cmd] )) ||
__mise_direnv_activate_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_direnv_envrc_cmd] )) ||
__mise_direnv_envrc_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_direnv_exec_cmd] )) ||
__mise_direnv_exec_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_doctor_cmd] )) ||
__mise_doctor_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_env_cmd] )) ||
__mise_env_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-J --json)'{-J,--json}'[Output in JSON format]' \
    '(-s --shell)'{-s,--shell}'=[Shell type to generate environment variables for]:shell:(bash fish nu xonsh zsh)' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_exec_cmd] )) ||
__mise_exec_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-c --command)'{-c,--command}'=[Command string to execute]:c:_cmdstring' \
    '(-j --jobs)'{-j,--jobs}'=[Number of jobs to run in parallel]:jobs:' \
    '--raw[Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_global_cmd] )) ||
__mise_global_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '--pin[Save exact version to \`~/.tool-versions\`]' \
    '--fuzzy[Save fuzzy version to \`~/.tool-versions\`]' \
    '*--remove=[Remove the plugin(s) from ~/.tool-versions]:remove:' \
    '--path[Get the path of the global config file]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_hook_env_cmd] )) ||
__mise_hook_env_cmd() {
  _arguments -s -S \
    '(-s --shell)'{-s,--shell}'=[Shell type to generate script for]:shell:(bash fish nu xonsh zsh)' \
    '(-q --quiet)'{-q,--quiet}'[Hide warnings such as when a tool is not installed]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_hook_not_found_cmd] )) ||
__mise_hook_not_found_cmd() {
  _arguments -s -S \
    '(-s --shell)'{-s,--shell}'=[Shell type to generate script for]:shell:(bash fish nu xonsh zsh)' \
    ':bin:' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_implode_cmd] )) ||
__mise_implode_cmd() {
  _arguments -s -S \
    '--config[Also remove config directory]' \
    '(-n --dry-run)'{-n,--dry-run}'[List directories that would be removed without actually removing them]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_install_cmd] )) ||
__mise_install_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-f --force)'{-f,--force}'[Force reinstall even if already installed]' \
    '(-j --jobs)'{-j,--jobs}'=[Number of jobs to run in parallel]:jobs:' \
    '--raw[Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1]' \
    '*'{-v,--verbose}'[Show installation output]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_latest_cmd] )) ||
__mise_latest_cmd() {
  _arguments -s -S \
    ':tool:__mise_tool_versions' \
    '(-i --installed)'{-i,--installed}'[Show latest installed instead of available version]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_link_cmd] )) ||
__mise_link_cmd() {
  _arguments -s -S \
    ':tool:__mise_tool_versions' \
    ':path:_directories' \
    '(-f --force)'{-f,--force}'[Overwrite an existing tool version if it exists]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_local_cmd] )) ||
__mise_local_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-p --parent)'{-p,--parent}'[Recurse up to find a .tool-versions file rather than using the current directory only]' \
    '--pin[Save exact version to \`.tool-versions\`]' \
    '--fuzzy[Save fuzzy version to \`.tool-versions\` e.g.\: \`mise local --fuzzy node@20\` will save \`node 20\` to .tool-versions This is the default behavior unless MISE_ASDF_COMPAT=1]' \
    '*--remove=[Remove the plugin(s) from .tool-versions]:remove:' \
    '--path[Get the path of the config file]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_ls_cmd] )) ||
__mise_ls_cmd() {
  _arguments -s -S \
    '*::plugin:__mise_plugins' \
    '(-c --current)'{-c,--current}'[Only show tool versions currently specified in a .tool-versions/.mise.toml]' \
    '(-g --global)'{-g,--global}'[Only show tool versions currently specified in a the global .tool-versions/.mise.toml]' \
    '(-i --installed)'{-i,--installed}'[Only show tool versions that are installed (Hides tools defined in .tool-versions/.mise.toml but not installed)]' \
    '(-J --json)'{-J,--json}'[Output in JSON format]' \
    '(-m --missing)'{-m,--missing}'[Display missing tool versions]' \
    '--prefix=[Display versions matching this prefix]:prefix:__mise_prefixes' \
    '--no-header[Don'\''t display headers]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_ls_remote_cmd] )) ||
__mise_ls_remote_cmd() {
  _arguments -s -S \
    '::plugin:__mise_plugins' \
    '--all[Show all installed plugins and versions]' \
    '::prefix:__mise_prefixes' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_outdated_cmd] )) ||
__mise_outdated_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-J --json)'{-J,--json}'[Output in JSON format]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_plugins_cmd] )) ||
__mise_plugins_cmd() {
  _arguments -s -S \
    '(-c --core)'{-c,--core}'[The built-in plugins only]' \
    '--user[List installed plugins]' \
    '(-u --urls)'{-u,--urls}'[Show the git url for each plugin]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_plugins_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (a|add|i|install) __mise_plugins_install_cmd && ret=0 ;;
        (ln|link) __mise_plugins_link_cmd && ret=0 ;;
        (list|ls) __mise_plugins_ls_cmd && ret=0 ;;
        (list-all|list-remote|ls-remote) __mise_plugins_ls_remote_cmd && ret=0 ;;
        (remove|rm|uninstall) __mise_plugins_uninstall_cmd && ret=0 ;;
        (up|upgrade|update) __mise_plugins_update_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_plugins_install_cmd] )) ||
__mise_plugins_install_cmd() {
  _arguments -s -S \
    ':new_plugin:__mise_all_plugins' \
    '::git_url:_urls' \
    '(-f --force)'{-f,--force}'[Reinstall even if plugin exists]' \
    '(-a --all)'{-a,--all}'[Install all missing plugins]' \
    '*'{-v,--verbose}'[Show installation output]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_plugins_link_cmd] )) ||
__mise_plugins_link_cmd() {
  _arguments -s -S \
    ':name:' \
    '::path:_directories' \
    '(-f --force)'{-f,--force}'[Overwrite existing plugin]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_plugins_ls_cmd] )) ||
__mise_plugins_ls_cmd() {
  _arguments -s -S \
    '(-c --core)'{-c,--core}'[The built-in plugins only]' \
    '--user[List installed plugins]' \
    '(-u --urls)'{-u,--urls}'[Show the git url for each plugin]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_plugins_ls_remote_cmd] )) ||
__mise_plugins_ls_remote_cmd() {
  _arguments -s -S \
    '(-u --urls)'{-u,--urls}'[Show the git url for each plugin e.g.\: https\://github.com/mise-plugins/rtx-nodejs.git]' \
    '--only-names[Only show the name of each plugin by default it will show a "*" next to installed plugins]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_plugins_uninstall_cmd] )) ||
__mise_plugins_uninstall_cmd() {
  _arguments -s -S \
    '*::plugin:__mise_plugins' \
    '(-p --purge)'{-p,--purge}'[Also remove the plugin'\''s installs, downloads, and cache]' \
    '(-a --all)'{-a,--all}'[Remove all plugins]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_plugins_update_cmd] )) ||
__mise_plugins_update_cmd() {
  _arguments -s -S \
    '*::plugin:__mise_plugins' \
    '(-j --jobs)'{-j,--jobs}'=[Number of jobs to run in parallel]:jobs:' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_prune_cmd] )) ||
__mise_prune_cmd() {
  _arguments -s -S \
    '*::plugin:__mise_plugins' \
    '(-n --dry-run)'{-n,--dry-run}'[Do not actually delete anything]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_reshim_cmd] )) ||
__mise_reshim_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_run_cmd] )) ||
__mise_run_cmd() {
  _arguments -s -S \
    '::task:__mise_tasks' \
    '*::args:' \
    '(-C --cd)'{-C,--cd}'=[Change to this directory before executing the command]:cd:_directories' \
    '(-n --dry-run)'{-n,--dry-run}'[Don'\''t actually run the tasks(s), just print them in order of execution]' \
    '(-f --force)'{-f,--force}'[Force the tasks to run even if outputs are up to date]' \
    '(-p --prefix)'{-p,--prefix}'[Print stdout/stderr by line, prefixed with the tasks'\''s label]' \
    '(-i --interleave)'{-i,--interleave}'[Print directly to stdout/stderr instead of by line]' \
    '*'{-t,--tool}'=[Tool(s) to also add e.g.\: node@20 python@3.10]:tool:__mise_tool_versions' \
    '(-j --jobs)'{-j,--jobs}'=[Number of tasks to run in parallel]:jobs:' \
    '(-r --raw)'{-r,--raw}'[Read/write directly to stdin/stdout/stderr instead of by line]' \
    '--timings[Shows elapsed time after each tasks]' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_self_update_cmd] )) ||
__mise_self_update_cmd() {
  _arguments -s -S \
    '(-f --force)'{-f,--force}'[Update even if already up to date]' \
    '--no-plugins[Disable auto-updating plugins]' \
    '(-y --yes)'{-y,--yes}'[Skip confirmation prompt]' \
    '::version:' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]'
}
(( $+functions[__mise_set_cmd] )) ||
__mise_set_cmd() {
  _arguments -s -S \
    '--file=[The TOML file to update]:file:_files' \
    '(-g --global)'{-g,--global}'[Set the environment variable in the global config file]' \
    '*::env_vars:' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_settings_cmd] )) ||
__mise_settings_cmd() {
  _arguments -s -S \
    '--keys[Only display key names for each setting]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_settings_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (get) __mise_settings_get_cmd && ret=0 ;;
        (list|ls) __mise_settings_ls_cmd && ret=0 ;;
        (add|create|set) __mise_settings_set_cmd && ret=0 ;;
        (del|delete|remove|rm|unset) __mise_settings_unset_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_settings_get_cmd] )) ||
__mise_settings_get_cmd() {
  _arguments -s -S \
    ':setting:__mise_settings' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_settings_ls_cmd] )) ||
__mise_settings_ls_cmd() {
  _arguments -s -S \
    '--keys[Only display key names for each setting]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_settings_set_cmd] )) ||
__mise_settings_set_cmd() {
  _arguments -s -S \
    ':setting:__mise_settings' \
    ':value:' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_settings_unset_cmd] )) ||
__mise_settings_unset_cmd() {
  _arguments -s -S \
    ':setting:__mise_settings' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_shell_cmd] )) ||
__mise_shell_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-j --jobs)'{-j,--jobs}'=[Number of jobs to run in parallel]:jobs:' \
    '--raw[Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1]' \
    '(-u --unset)'{-u,--unset}'[Removes a previously set version]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_sync_cmd] )) ||
__mise_sync_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_sync_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (node) __mise_sync_node_cmd && ret=0 ;;
        (python) __mise_sync_python_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_sync_node_cmd] )) ||
__mise_sync_node_cmd() {
  _arguments -s -S \
    '--brew[Get tool versions from Homebrew]' \
    '--nvm[Get tool versions from nvm]' \
    '--nodenv[Get tool versions from nodenv]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_sync_python_cmd] )) ||
__mise_sync_python_cmd() {
  _arguments -s -S \
    '--pyenv[Get tool versions from pyenv]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_tasks_cmd] )) ||
__mise_tasks_cmd() {
  _arguments -s -S \
    '--no-header[Do not print table header]' \
    '(-x --extended)'{-x,--extended}'[Show all columns]' \
    '--hidden[Show hidden tasks]' \
    '--sort=[Sort by column. Default is name.]:sort:(name alias description source)' \
    '--sort-order=[Sort order. Default is asc.]:sort_order:(asc desc)' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]' \
    '1: :__mise_tasks_cmds' \
    '*::arg:->args' && ret=0

      case "$state" in
    (args)
      curcontext="${curcontext%:*:*}:mise-cmd-$words[1]:"
      case $words[1] in
        (deps) __mise_tasks_deps_cmd && ret=0 ;;
        (edit) __mise_tasks_edit_cmd && ret=0 ;;
        (ls) __mise_tasks_ls_cmd && ret=0 ;;
        (r|run) __mise_tasks_run_cmd && ret=0 ;;
      esac
    ;;
  esac

return ret
}
(( $+functions[__mise_tasks_deps_cmd] )) ||
__mise_tasks_deps_cmd() {
  _arguments -s -S \
    '*::tasks:' \
    '--hidden[Show hidden tasks]' \
    '--dot[Display dependencies in DOT format]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_tasks_edit_cmd] )) ||
__mise_tasks_edit_cmd() {
  _arguments -s -S \
    ':task:__mise_tasks' \
    '(-p --path)'{-p,--path}'[Display the path to the tasks instead of editing it]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_tasks_ls_cmd] )) ||
__mise_tasks_ls_cmd() {
  _arguments -s -S \
    '--no-header[Do not print table header]' \
    '(-x --extended)'{-x,--extended}'[Show all columns]' \
    '--hidden[Show hidden tasks]' \
    '--sort=[Sort by column. Default is name.]:sort:(name alias description source)' \
    '--sort-order=[Sort order. Default is asc.]:sort_order:(asc desc)' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_tasks_run_cmd] )) ||
__mise_tasks_run_cmd() {
  _arguments -s -S \
    '::task:__mise_tasks' \
    '*::args:' \
    '(-C --cd)'{-C,--cd}'=[Change to this directory before executing the command]:cd:_directories' \
    '(-n --dry-run)'{-n,--dry-run}'[Don'\''t actually run the tasks(s), just print them in order of execution]' \
    '(-f --force)'{-f,--force}'[Force the tasks to run even if outputs are up to date]' \
    '(-p --prefix)'{-p,--prefix}'[Print stdout/stderr by line, prefixed with the tasks'\''s label]' \
    '(-i --interleave)'{-i,--interleave}'[Print directly to stdout/stderr instead of by line]' \
    '*'{-t,--tool}'=[Tool(s) to also add e.g.\: node@20 python@3.10]:tool:__mise_tool_versions' \
    '(-j --jobs)'{-j,--jobs}'=[Number of tasks to run in parallel]:jobs:' \
    '(-r --raw)'{-r,--raw}'[Read/write directly to stdin/stdout/stderr instead of by line]' \
    '--timings[Shows elapsed time after each tasks]' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_trust_cmd] )) ||
__mise_trust_cmd() {
  _arguments -s -S \
    '::config_file:_files' \
    '(-a --all)'{-a,--all}'[Trust all config files in the current directory and its parents]' \
    '--untrust[No longer trust this config]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_uninstall_cmd] )) ||
__mise_uninstall_cmd() {
  _arguments -s -S \
    '*::installed_tool:__mise_installed_tool_versions' \
    '(-a --all)'{-a,--all}'[Delete all installed versions]' \
    '(-n --dry-run)'{-n,--dry-run}'[Do not actually delete anything]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_unset_cmd] )) ||
__mise_unset_cmd() {
  _arguments -s -S \
    '*::keys:' \
    '(-f --file)'{-f,--file}'=[Specify a file to use instead of ".mise.toml"]:file:_files' \
    '(-g --global)'{-g,--global}'[Use the global config file]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_upgrade_cmd] )) ||
__mise_upgrade_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-n --dry-run)'{-n,--dry-run}'[Just print what would be done, don'\''t actually do it]' \
    '(-j --jobs)'{-j,--jobs}'=[Number of jobs to run in parallel]:jobs:' \
    '(-i --interactive)'{-i,--interactive}'[Display multiselect menu to choose which tools to upgrade]' \
    '--raw[Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_usage_cmd] )) ||
__mise_usage_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_use_cmd] )) ||
__mise_use_cmd() {
  _arguments -s -S \
    '*::tool:__mise_tool_versions' \
    '(-f --force)'{-f,--force}'[Force reinstall even if already installed]' \
    '--fuzzy[Save fuzzy version to config file]' \
    '(-g --global)'{-g,--global}'[Use the global config file (~/.config/mise/config.toml) instead of the local one]' \
    '(-e --env)'{-e,--env}'=[Modify an environment-specific config file like .mise.<env>.toml]:env:' \
    '(-j --jobs)'{-j,--jobs}'=[Number of jobs to run in parallel]:jobs:' \
    '--raw[Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1]' \
    '*--remove=[Remove the plugin(s) from config file]:remove:' \
    '(-p --path)'{-p,--path}'=[Specify a path to a config file or directory If a directory is specified, it will look for .mise.toml (default) or .tool-versions]:path:_files' \
    '--pin[Save exact version to config file]' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_version_cmd] )) ||
__mise_version_cmd() {
  _arguments -s -S \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_watch_cmd] )) ||
__mise_watch_cmd() {
  _arguments -s -S \
    '*'{-t,--task}'=[Tasks to run]:task:__mise_tasks' \
    '*::args:' \
    '*'{-g,--glob}'=[Files to watch]:glob:' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_where_cmd] )) ||
__mise_where_cmd() {
  _arguments -s -S \
    ':tool:__mise_tool_versions' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_which_cmd] )) ||
__mise_which_cmd() {
  _arguments -s -S \
    ':bin_name:' \
    '--plugin[Show the plugin name instead of the path]' \
    '--version[Show the version instead of the path]' \
    '(-t --tool)'{-t,--tool}'=[Use a specific tool@version]:tool:__mise_tool_versions' \
    '(-C --cd)'{-C,--cd}'=[Change directory before running command]:cd:_directories' \
    '(-q --quiet)'{-q,--quiet}'[Suppress non-error messages]' \
    '*'{-v,--verbose}'[Show extra output (use -vv for even more)]' \
    '(-y --yes)'{-y,--yes}'[Answer yes to all confirmation prompts]'
}
(( $+functions[__mise_cmds] )) ||
__mise_cmds() {
  local commands; commands=(
    'activate:Initializes mise in the current shell session'
    {a,alias}':Manage aliases'
    'bin-paths:List all the active runtime bin paths'
    'cache:Manage the mise cache'
    'completion:Generate shell completions'
    {cfg,config}':\[experimental\] Manage config files'
    'current:Shows current active and installed runtime versions'
    'deactivate:Disable mise for current shell session'
    'direnv:Output direnv function to use mise inside direnv'
    {dr,doctor}':Check mise installation for possible problems'
    {e,env}':Exports env vars to activate mise a single time'
    {x,exec}':Execute a command with tool(s) set'
    'implode:Removes mise CLI and all related data'
    {i,install}':Install a tool version'
    'latest:Gets the latest available version for a plugin'
    {ln,link}':Symlinks a tool version into mise'
    {list,ls}':List installed and active tool versions'
    'ls-remote:List runtime versions available for install'
    'outdated:Shows outdated tool versions'
    {p,plugins}':Manage plugins'
    'prune:Delete unused versions of tools'
    'reshim:rebuilds the shim farm'
    {r,run}':\[experimental\] Run a tasks'
    'self-update:Updates mise itself'
    'set:Manage environment variables'
    'settings:Manage settings'
    {sh,shell}':Sets a tool version for the current session'
    'sync:Add tool versions from external tools to mise'
    {t,tasks}':\[experimental\] Manage tasks'
    'trust:Marks a config file as trusted'
    {remove,rm,uninstall}':Removes runtime versions'
    'unset:Remove environment variable(s) from the config file'
    {up,upgrade}':Upgrades outdated tool versions'
    'usage:Generate a usage CLI spec'
    {u,use}':Install tool version and add it to config'
    'version:Show mise version'
    {w,watch}':\[experimental\] Run a tasks watching for changes'
    'where:Display the installation path for a runtime'
    'which:Shows the path that a bin name points to'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_alias_cmds] )) ||
__mise_alias_cmds() {
  local commands; commands=(
    'get:Show an alias for a plugin'
    {list,ls}':List aliases'
    {add,create,set}':Add/update an alias for a plugin'
    {del,delete,remove,rm,unset}':Clears an alias for a plugin'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_cache_cmds] )) ||
__mise_cache_cmds() {
  local commands; commands=(
    {c,clear}':Deletes all cache files in mise'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_config_cmds] )) ||
__mise_config_cmds() {
  local commands; commands=(
    {g,generate}':\[experimental\] Generate an .mise.toml file'
    'ls:\[experimental\] List config files currently in use'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_direnv_cmds] )) ||
__mise_direnv_cmds() {
  local commands; commands=(
    'activate:Output direnv function to use mise inside direnv'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_plugins_cmds] )) ||
__mise_plugins_cmds() {
  local commands; commands=(
    {a,add,i,install}':Install a plugin'
    {ln,link}':Symlinks a plugin into mise'
    {list,ls}':List installed plugins'
    {list-all,list-remote,ls-remote}':List all available remote plugins'
    {remove,rm,uninstall}':Removes a plugin'
    {up,upgrade,update}':Updates a plugin to the latest version'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_settings_cmds] )) ||
__mise_settings_cmds() {
  local commands; commands=(
    'get:Show a current setting'
    {list,ls}':Show current settings'
    {add,create,set}':Add/update a setting'
    {del,delete,remove,rm,unset}':Clears a setting'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_sync_cmds] )) ||
__mise_sync_cmds() {
  local commands; commands=(
    'node:Symlinks all tool versions from an external tool into mise'
    'python:Symlinks all tool versions from an external tool into mise'
  )
  _describe -t commands 'command' commands "$@"
}
(( $+functions[__mise_tasks_cmds] )) ||
__mise_tasks_cmds() {
  local commands; commands=(
    'deps:\[experimental\] Display a tree visualization of a dependency graph'
    'edit:\[experimental\] Edit a tasks with \$EDITOR'
    'ls:\[experimental\] List available tasks to execute'
    {r,run}':\[experimental\] Run a tasks'
  )
  _describe -t commands 'command' commands "$@"
}

(( $+functions[__mise_tool_versions] )) ||
__mise_tool_versions() {
  if compset -P '*@'; then
    local -a tool_versions; tool_versions=($(mise ls-remote ${words[CURRENT]}))
    _wanted tool_version expl 'version of tool' \
      compadd -a tool_versions -o nosort
  else
    local -a plugins; plugins=($(mise plugins --core --user))
    _wanted plugin expl 'plugin name' \
      compadd -S '@' -a plugins
  fi
}
(( $+functions[__mise_installed_tool_versions] )) ||
__mise_installed_tool_versions() {
  if compset -P '*@'; then
    local plugin; plugin=${words[CURRENT]%%@*}
    local -a installed_tool_versions; installed_tool_versions=($(mise ls --installed $plugin | awk '{print $2}'))
    _wanted installed_tool_version expl 'version of tool' \
      compadd -a installed_tool_versions -o nosort
  else
    local -a plugins; plugins=($(mise plugins --core --user))
    _wanted plugin expl 'plugin name' \
      compadd -S '@' -a plugins
  fi
}
(( $+functions[__mise_plugins] )) ||
__mise_plugins() {
  local -a plugins; plugins=($(mise plugins --core --user))
  _describe -t plugins 'plugin' plugins "$@"
}
(( $+functions[__mise_all_plugins] )) ||
__mise_all_plugins() {
  local -a all_plugins; all_plugins=($(mise plugins --all))
  _describe -t all_plugins 'all_plugins' all_plugins "$@"
}
(( $+functions[__mise_aliases] )) ||
__mise_aliases() {
  local -a aliases; aliases=($(mise aliases ls ${words[CURRENT-1]} | awk '{print $2}'))
  _describe -t aliases 'alias' aliases "$@"
}
(( $+functions[__mise_settings] )) ||
__mise_settings() {
  local -a settings; settings=($(mise settings ls | awk '{print $1}'))
  _describe -t settings 'setting' settings "$@"
}
(( $+functions[__mise_tasks] )) ||
__mise_tasks() {
  local -a tasks; tasks=($(mise tasks ls --no-header | awk '{print $1}'))
  _describe -t tasks 'task' tasks "$@"
}
(( $+functions[__mise_prefixes] )) ||
__mise_prefixes() {
  if [[ CURRENT -gt 2 ]]; then
      local -a prefixes; prefixes=($(mise ls-remote ${words[CURRENT-1]}))
      _describe -t prefixes 'prefix' prefixes "$@"
  fi
}

if [ "$funcstack[1]" = "_mise" ]; then
    _mise "$@"
else
    compdef _mise mise
fi

# vim: noet ci pi sts=0 sw=4 ts=4
