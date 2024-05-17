
#' Concatenate GoPro video clips
#'
#' @param folder A Character providing the path to the folder containing the video clips to stich together
#' @param no_audio A logical dropping (TRUE) or keeping audio (FALSE)
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#'concat_clips("09_16_23 1108 baseline", no_audio=TRUE)
#'}

concat_clips <- function(folder, no_audio=TRUE) {
  # get the video clips
  video_clips <- list.files(path = folder, pattern = "MP4", full.names = TRUE)
  # create the clip list
  capture.output(
    for (f in video_clips) {
      cat(noquote(sprintf("file '%s'\n", f)))
      },
    file = file.path(folder, "clips_list.txt")
  )
  system2(
    sprintf("ffmpeg  -f concat -safe 0 -i %s/clips_list.txt -an -c copy %s/output_test_noaudio.mp4", "/Users/julien/Data/Caves/Ped\ 1/09_16_23\ 1108\ baseline","/Users/julien/Data/Caves/Ped\ 1/09_16_23\ 1108\ baseline")
          ) # does not keep the space escape
}


# CLI - ffmpeg  -f concat -safe 0 -i /Users/julien/Data/Caves/Ped 1/09_16_23 1108 baseline/clips_list.txt -an -c copy /Users/julien/Data/Caves/Ped 1/09_16_23 1108 baseline/output_test_noaudio.mp4


