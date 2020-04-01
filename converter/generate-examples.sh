EXAMPLES=(
"leonardo" "michaelangelo" "donatello" "raphael"
"fsm-creation" "this-is-fine"
"hank" "dale" "boomhauer" "bill" "hank-hill-tc"
"link-surf-tc" "link-champion" "link-awaken" "link-glider" "link-snow" "link-zora" "link-stealth" "link-dark-tc" "link-shorts-tc"
"strongbad" "trogdor"
"homer-simpson" "bart" "mr-burns" "flanders-devil"
"duke-nukem" "master-chief2" "banjo-kazooie2" "grunty-broom" "gruntilda" "boggy" "snacker" "klungo"
"tobias"
"hermes-tc" "robot-devil" "roberto-tc"
"ken" "ryu" "max-payne"
"tf2-spy2"
)

SCRIPT_DIR=$(dirname "$0")

function generate() {
  echo '<body><h2>Cowsay image example files</h2>'
  echo '<link rel="stylesheet" type="text/css" href="src/style.css">'
  echo '<div class="image-container" style="background: #000;">'

  for cowfile in ${EXAMPLES[@]}; do
    echo '  <div class="cow-tile">'
    echo "    <span class=\"label\">${cowfile}.cow</span>"
    echo '    <div class="wrapper">'
    echo '      <div class="relative-position-box">'
    echo '        <div class="max-height-box">'
    echo "          <img src=\"src_images/${cowfile}.png\" class=\"cow-img\">"
    echo '        </div>'
    echo '      </div>'
    echo '    </div>'
    echo '  </div>'
  done

  for cowfile in ${SCRIPT_DIR}/../cows/*.cow; do
    cowname=$(basename $cowfile)
    firstchar=${cowname:0:1}

    if [[ $firstchar != "_" && $cowname != "default.cow" ]]; then
      # skip any cows that start with _, these are test cows
      # echo ""
      # echo "## ${cowname}"
      cowname="${cowname%.*}"

      imgname=""

      #check if image file matching this cow name exists
      FILE=converter/src_images/${cowname}.png
      if test -f "${SCRIPT_DIR}/../$FILE"; then
        imgname="$FILE"
      fi
      if [ ! -z "$imgname" ]; then  #if cow doesn't have a png image related, then just print the cow normally

          # echo '```'
          # cowsay -f ${cowfile} "$cowname"
          # echo '```'
      #else # otherwise insert an image tag for the source image
        echo '  <div class="cow-tile">'
        echo "    <span class=\"label\">${cowname}.cow</span>"
        echo '    <div class="wrapper">'
        echo '      <div class="relative-position-box">'
        echo '        <div class="max-height-box">'
        echo "          <img src=\"src_images/${cowname}.png\" class=\"cow-img\">"
        echo '        </div>'
        echo '      </div>'
        echo '    </div>'
        echo '  </div>'
      fi
      echo ""
    fi
  done

  echo '</div></body>'
}

generate > examples.html
