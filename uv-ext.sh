function uv-ext() {
    UVDIR=$HOME/.uv-ext
    UVENVDIR=$UVDIR/envs

    CMD="uv-ext"

    mkdir -p $UVDIR
    mkdir -p $UVENVDIR

    # help
    help() {
        command
        echo "Extended uv command for global virtual environments operations."
        echo ""
        echo "Usage: $CMD <COMMANd> [OPTIONS]"
        echo ""
        echo "Commands:"
        echo "  list                 List global uv virtual environments"
        echo "  create <venv name>   Create a new global uv virtual environments"
        echo "  remove <venv name>   Remove a global uv virtual environments"
        echo "  activate <venv name> Activate a global uv virtual environments"
        echo ""
        echo "Options:"
        echo "  --help               Show this help message"
        echo ""
    }
    invalid() {
        command
        echo "Invalid command."
        echo ""
        echo "For more information, try $CMD --help"
    }
    # command: list
    help_list() {
        command
        echo "List global uv virtual environments."
        echo ""
        echo "Usage: $CMD list [--help]"
        echo ""
        echo "Options:"
        echo "  --help               Show this help message"
        echo ""
    }
    invalid_list() {
        command
        echo "Invalid usage of $CMD list"
        echo ""
        echo "For more information, try $CMD list --help"
        echo ""
    }
    # command: create
    help_create() {
        command
        echo "Create a new global uv virtual environments."
        echo ""
        echo "Usage: $CMD create [OPTIONS] <venv name>"
        echo ""
        echo "Options:"
        echo "  --help               Show this help message"
        echo ""
        echo ""
        echo "More Options from uv:"
        echo ""
        uv venv --help
    }
    # command: remove
    help_remove() {
        command
        echo "Remove a global uv virtual environments."
        echo ""
        echo "Usage: $CMD remove [OPTIONS] <venv name>"
        echo ""
        echo "Options:"
        echo "  --help               Show this help message"
        echo ""
    }
    # command: activate
    help_activate() {
        command
        echo "Activate a new global uv virtual environments."
        echo ""
        echo "Usage: $CMD activate [OPTIONS] <venv name>"
        echo ""
        echo "Options:"
        echo "  --help               Show this help message"
        echo ""
    }
    
    case $* in
        # help
        '--help' ) help ;;
        '--help '* ) help ;;
        # list
        'list --help' ) help_list ;;
        'list --help '* ) help_list ;;
        'list '*' --help' ) help_list ;;
        'list '*' --help '* ) help_list ;;
        'list '* ) invalid_list ;;
        'list' ) shift 1; command ls $UVENVDIR | sed -e 's/\ +/\n/';;
        # create
        'create --help' ) help_create ;;
        'create --help '* ) help_create ;;
        'create '*' --help' ) help_create ;;
        'create '*' --help '* ) help_create ;;
        'create '* ) shift 1; command uv venv --directory $UVENVDIR "$@" ;;
        # remove
        'remove --help' ) help_remove ;;
        'remove --help '* ) help_remove ;;
        'remove '*' --help' ) help_remove ;;
        'remove '*' --help '* ) help_remove ;;
        'remove '* ) shift 1; command rm -Ir $UVENVDIR/"$@" ;;
        # activate
        'activate --help' ) help_activate ;;
        'activate --help '* ) help_activate ;;
        'activate '*' --help' ) help_activate ;;
        'activate '*' --help '* ) help_activate ;;
        'activate '* ) shift 1; command source $UVENVDIR/"$@"/bin/activate ;;
        * ) help ;;
    esac
}
