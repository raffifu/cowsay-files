EXAMPLES=(
"michaelangelo" "donatello" "peanuts" "rambo" "dave" "lahey"
"pickle-rick" "rick-and-morty-split" "rick-and-morty-running"
"fsm-creation" "this-is-fine" "tf2-spy2"
"forrest-gump" "beetlejuice" "jayhawk"
"bojack" "mr-peanutbutter"
"stormtrooper2" "vader"
"batman2" "spiderman3"
"it-crowd" "kermit"
"roberto" "calculon"
"chester"
"garfield-face" "snoopy-doghouse"
)

SCRIPT_DIR=$(dirname "$0")

function generate() {
  echo '<body><h2>Cowsay image example files</h2>'
  echo '<link rel="stylesheet" type="text/css" href="src/style.css">'
  echo '<div class="image-container" style="background: #000;">'

  for cowfile in ${EXAMPLES[@]}; do
    echo '  <div class="cow-tile">'
    echo "    <div class=\"label\">${cowfile}.cow</div>"
    echo '    <div class="wrapper">'
    # echo '      <div class="relative-position-box">'
    echo "        <img src=\"src_images/${cowfile}.png\" class=\"sizer\">"
    # echo '        <div class="max-height-box">'
    # echo "          <img src=\"src_images/${cowfile}.png\" class=\"cow-img\">"
    # echo '        </div>'
    echo '      </div>'
    # echo '    </div>'
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
        echo '  <div class="cow-tile">'
        echo "    <div class=\"label\">${cowname}.cow</div>"
        echo '    <div class="wrapper">'
        # echo '      <div class="relative-position-box">'
        # echo '        <div class="max-height-box">'
        echo "          <img src=\"src_images/${cowname}.png\" class=\"sizer\">"
        # echo '        </div>'
        # echo '      </div>'
        echo '    </div>'
        echo '  </div>'
      fi


      COW="cows/true-color/${cowname}.cow"
      if test -f "${SCRIPT_DIR}/../$COW"; then
        FILE="converter/src_images/${cowname}-tc.png"
        imgname="${cowname}"
        if test -f "${SCRIPT_DIR}/../$FILE"; then
          echo '  <div class="cow-tile">'
          echo "    <div class=\"label\">${cowname}.cow (true color)</div>"
          echo '    <div class="wrapper">'
          # echo '      <div class="relative-position-box">'
          # echo '        <div class="max-height-box">'
          echo "          <img src=\"src_images/${cowname}-tc.png\" class=\"sizer\">"
          # echo '        </div>'
          # echo '      </div>'
          echo '    </div>'
          echo '  </div>'
        fi
      fi
    fi
  done

  echo '</div></body>'
}

generate > examples.html
