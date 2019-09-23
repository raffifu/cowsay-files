EXAMPLES=(
"hank" "dale" "boomhauer" "bill" "hank-hill-tc"
"link-surf-tc" "link-champion" "link-awaken" "link-glider" "link-snow" "link-zora" "link-stealth" "link-dark-tc" "link-shorts-tc"
"leonardo" "michaelangelo" "donatello" "raphael"
"strongbad" "trogdor"
"homer-simpson" "bart" "mr-burns" "flanders-devil"
"duke-nukem" "master-chief2" "banjo-kazooie2" "grunty-broom" "gruntilda" "boggy" "snacker" "klungo"
"tobias"
"hermes-tc" "robot-devil" "roberto-tc"
"ken" "ryu" "max-payne"
"fsm-creation" "this-is-fine"
"tf2-spy2"
)

function generate() {
  echo '<h2>Cowsay image example files</h2>'
  echo '<link rel="stylesheet" type="text/css" href="src/style.css">'
  echo '<div class="example_images" style="background: #000;">'

  for cowfile in ${EXAMPLES[@]}; do
    echo '  <div class="img-container">'
    echo "    <img src=\"src_images/${cowfile}.png\" class=\"cow-img\">"
    echo "  </div>"
  done

  echo '</div>'
}

generate > examples.html
