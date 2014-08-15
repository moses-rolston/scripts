# unpack and pack function for archives of different types
unpack () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
	    *.ipa)	      unzip $1		;;
	    *.apk)	      unzip $1		;;
            *)                echo "'$1' cannot be extracted via unpack()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

pack () {
    if [ -f $2 ] ; then
	case $1 in
	    *.tar.bz2)        tar -cvjC $1 $2 ;;
	    *.tbz2)           tar -cvjC $1 $2 ;;
	    *.tar.gz)         tar -cvzC $1 $2 ;;
	    *.tgz)            tar -cvzC $1 $2 ;;
	    *)                echo "'$2' cannot be compressed via pack()" ;;
	esac
    else
	echo "'$2' is not a valid file or directory"
    fi
}
