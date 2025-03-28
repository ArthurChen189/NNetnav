# -------------------- WebArena setup -------------------- #
# PUBLIC_HOSTNAME=$(curl -s ifconfig.me)
PUBLIC_HOSTNAME="localhost"

# Change ports as desired
SHOPPING_PORT=8082
SHOPPING_ADMIN_PORT=8083
REDDIT_PORT=8080
# GITLAB_PORT=9001
GITLAB_PORT=10001
WIKIPEDIA_PORT=8081
MAP_PORT=443
HOMEPAGE_PORT=80
RESET_PORT=7565

# Original webarena ports
# SHOPPING_PORT=7770
# SHOPPING_ADMIN_PORT=7780
# REDDIT_PORT=9999
# GITLAB_PORT=8023
# WIKIPEDIA_PORT=8888
# MAP_PORT=3000
# HOMEPAGE_PORT=4399

SHOPPING_URL="http://${PUBLIC_HOSTNAME}:${SHOPPING_PORT}"
SHOPPING_ADMIN_URL="http://${PUBLIC_HOSTNAME}:${SHOPPING_ADMIN_PORT}/admin"
REDDIT_URL="http://${PUBLIC_HOSTNAME}:${REDDIT_PORT}/forums/all"
GITLAB_URL="http://${PUBLIC_HOSTNAME}:${GITLAB_PORT}/explore"
WIKIPEDIA_URL="http://${PUBLIC_HOSTNAME}:${WIKIPEDIA_PORT}/wikipedia_en_all_maxi_2022-05/A/User:The_other_Kiwix_guy/Landing"
MAP_URL="http://${PUBLIC_HOSTNAME}:${MAP_PORT}"
HOMEPAGE_URL="http://${PUBLIC_HOSTNAME}:${HOMEPAGE_PORT}"

# -------------------- end --------------------- #

# -------------------- NNetNav setup -------------------- #
export WA_SHOPPING="${SHOPPING_URL}"
export WA_SHOPPING_ADMIN="${SHOPPING_ADMIN_URL}"
export WA_REDDIT="${REDDIT_URL}"
export WA_GITLAB="${GITLAB_URL}"
export WA_MAP="${MAP_URL}"
export WA_WIKIPEDIA="${WIKIPEDIA_URL}"
export WA_HOMEPAGE="${HOMEPAGE_URL}"
# -------------------- end -------------------- #
