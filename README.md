# Pomodoro Timer (Bash)

A simple Pomodoro timer written in BAsh for Linux/macOS/WSL users

## Features

- 25-minute focus sessions
- 5-minute short breaks
- Colorful terminal showing the remaining time of the session/break
- Terminal notifications (if supported)

## Installation

1. Clone this repository:

```bash
git clone https://github.com/Fehl/PomodoroBashCLI.git
cd PomodoroBashCLI
```

2. Make the script executable:
```bash
chmod +x pomodoro.sh
```

3. (Optional) Move it to a folder in your PATH for global use:
```bash
sudo mv pomodoro.sh /usr/local/bin/pomodoro
```

4. Now you can run it from anywhere with:
```bash
pomodoro #if installed globally
./pomodoro.sh #if skipped step 3.
```
