function fancy_echo {
  local message="$1"
  local color="${2:-blue}"
  local color_code=""
  
  case "$color" in
    "red")
      color_code="31"
      ;;
    "green")
      color_code="32"
      ;;
    "blue")
      color_code="34"
      ;;
    "yellow")
      color_code="33"
      ;;
    *)
      echo "Error: Invalid color"
      return 1
      ;;
  esac
  
  echo -e "\e[${color_code}m${message}\e[0m"
}