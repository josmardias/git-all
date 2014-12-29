MY_PROJECT_PATH="~/git/my-project"

_git_all ()
{
    local cur prev opts core_path
    core_path=$MY_PROJECT_PATH
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="checkout diff help merge status"

    case "$prev" in
        merge)
            ;&
        checkout)
            opts=$(cd $core_path; __git_refs;)
            ;;
        diff) 
            ;&
        help) 
            ;&
        status)
            opts=""
            ;;
        *)
            ;;
    esac

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _git_all ./git-all

