library(usethis)
usethis::use_pipe()
#' Summon a whale
#'
#' @description
#' Summon a whale for a customisable pick-me-up
#'
#' @param what Whatever phrase you want the whale to echo. If not supplied, a random phrase is chosen
#'
#' @return Whale-shaped message
#' @export
#'
#' @examples
#' say("You're whale-come!")


say <- function(what){
  # Defining the whale ASCII
  whale = "\n            ------ \n           %s \n            ------ \n               \\\   \n                \\\  \n                 \\\
     .-'
'--./ /     _.---.
'-,  (__..-`       \\
   \\          .     |
    `,.__.   ,__.--/
     '._/_.'___.-`
"
#Finding the position of where to print message
  what_pos_start <-
    regexpr('%s', whale)[1] - 1

  what_pos_end <- what_pos_start + 3

  #If what isn't supplied
  if(missing(what)){
    what <- phrases %>% sample(size = 1)
  }

  #Combining positions, message and whale together
  out <- paste0(substr(whale, 1, what_pos_start),
                what,
                substr(whale, what_pos_end, nchar(whale)))

  # Return whale message
  message(out)
}

#' Whale pun phrases used in say()
#' @keywords internal
phrases <- c(
  "You're whale-come!",
  "How are you? I'm whaley good!",
  "I'm having a whale of a time!",
  "Whale, whale, whale...look who's here!",
  "Gee...this is over-whalming!",
  "Everything whale be alright!",
  "Get whale soon!",
  "Whale done! This looks great!",
  "What do you call a pod of noisy whales?        An ORCASTRA!"
)

usethis::use_mit_license("Charlie Recchia")
usethis::use_testthat()
usethis::use_test("ohwhaley")
usethis::use_git()
