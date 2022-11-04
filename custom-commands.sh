##  Set GITUSER_EMAIL from gitconfig
setgituser(){
    GITUSER_EMAIL=`cat ~/.gitconfig | egrep email | awk -F"=" '{print $2}' | sed -e 's/^ //'`
}

getgituser(){
    echo "Git user is $GITUSER_EMAIL"
}
## Set git profile
gituser(){
    opt=$1
    while :
     do
        case $opt in
          -p)
              if test -r ~/.gitconfigPersonal; then
                  echo "switching to personal github user"
                  cp ~/.gitconfigPersonal ~/.gitconfig
                  setgituser
              else
                  echo "ERROR: ~/.gitconfigPersonal does not exist."
              fi
              break;
              ;;
          -w) 
              if test -r ~/.gitconfigWork; then
                  echo "switching to work bitbucket user"
                  cp ~/.gitconfigWork ~/.gitconfig
                  setgituser
              else
                  echo "ERROR: ~/.gitconfigWork does not exist."
              fi
              break;
              ;;
          *)
              echo "Invalid option: -$OPTARG" >&2
              echo "USAGE: -p [switch to personal], -w [switch to work]"
              break;
              ;;
        esac
      done
      echo "Git user is $GITUSER_EMAIL"
}
