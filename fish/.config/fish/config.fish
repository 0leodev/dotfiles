if status is-interactive
#     # Commands to run in interactive sessions can go here
    if test (tput cols) -ge 100
        fastfetch
    end
end
