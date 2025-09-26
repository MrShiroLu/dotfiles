alias kaspervpn "sudo openvpn --config /home/burak/Documents/vpn/kaspersky/credentials.ovpn --auth-user-pass /home/burak/Documents/vpn/kaspersky/kasper_vpn.txt"

alias vpnstatus "ip addr show tun0"

function vpn-status
    if test -n (ip addr show tun0 2>/dev/null)
        echo "VPN Bağlı"
        curl -s ipinfo.io/ip
    else
        echo "VPN Bağlı Değil"
    end
end

function vpnkill
    sudo pkill openvpn
end

function vpnrestart
    echo "Restarting kaspervpn"
    vpnkill
    sleep 2
    kaspervpn
end

function myip
    curl -s ipinfo.io/ip
end

function mylocation
    curl -s ipinfo.io | jq -r '.city + ", " + .country'
end

function ipfull
    curl -s ipinfo.io | jq
end

# checking battery status
function batterycheck
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
end

function changewall
    bash .config/hypr/scripts/change_walls.sh
end

function forget
   echo "   kaspervpn -> connect kaspersky vpn with openvpn
   vpnstatus -> check vpn status
   vpnrestart -> restart vpn connection
   myip -> look ip
   batterycheck -> check battery healt
   changewall -> change wallpaper"
end

# Created by `pipx` on 2025-07-08 14:15:30
set PATH $PATH /home/burak/.local/bin
