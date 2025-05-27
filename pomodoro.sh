WORK_DURATION=25 #minutes
BREAK_DURATION=5 #minutes

#Colors

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

work_seconds=$((WORK_DURATION * 60))
break_seconds=$((BREAK_DURATION * 60))

progress_bar() {
	local elapsed=$1
	local total=$2
	local width=30

	local percent=$((elapsed * 100 / total))
	local filled=$((elapsed * width / total))
	local empty=$((width - filled))

	local colors=(
        '\033[0;31m' # Red
        '\033[1;33m' # Yellow
        '\033[0;32m' # Green
        '\033[0;36m' # Cyan
        '\033[0;34m' # Blue
        '\033[0;35m' # Magenta
    )

	printf "["
	for ((i = 0; i < filled; i++)); do
        color=${colors[i % ${#colors[@]}]}
        printf "${color}#"
	done
    printf "${NC}"  # Reset color
    printf '%0.s-' $(seq 1 $empty)
    printf "] %3d%%" "$percent"
}



countdown() {
	local total_seconds=$1
	local message=$2

	for ((elapsed = 0; elapsed <= total_seconds; elapsed++)); do
        local remaining=$((total_seconds - elapsed))
        printf "\r${color}%s ${NC} %02d:%02d " "$message" $((remaining / 60)) $((remaining % 60))
        progress_bar $elapsed $total_seconds
        sleep 1
	done
	echo -e "\nDone: $message"
	notify-send "$message done!" "Take a break or get back to work."
}

#Pomodoro Loop
while true; do
	clear
	echo "🍅 Pomodoro started. Focus for $WORK_DURATION minutes!"
	countdown $work_seconds "Work session"
	
	echo "🌿 Time for a break! Relax for $BREAK_DURATION minutes!"
	countdown $break_seconds "Break session"

	read -p "Start another Pomodoro? (y/n): " answer
	[[ $answer != [Yy] ]] && break
done

