
#' Concatenate GoPro video clips
#'
#' @param folder_in A Character providing the path to the folder containing the video clips to stitch together
#' @param folder_out A Character providing the path to the folder where to save the concatenated video
#' @param full_video_name A Character filename for the full length video
#' @param no_audio A logical dropping (TRUE) or keeping audio (FALSE)
#'
#' @importFrom utils capture.output
#'
#' @return A Character path to stitched video
#' @export
#'
#' @examples
#' \dontrun{
#'concat_clips("folder_in=baseline", full_video_name="baseline_full.mp4", no_audio=TRUE)
#'}

concat_clips <- function(folder_in, folder_out = folder_in, full_video_name, no_audio=TRUE) {
  # get the video clips
  video_clips <- list.files(path = folder_in, pattern = "MP4", full.names = TRUE)
  # create the clip list
  capture.output(
    for (f in video_clips) {
      cat(noquote(sprintf("file '%s'\n", f)))
      },
    file = file.path(folder_in, "clips_list.txt")
  )
  # Stitch the video clips together
  if (no_audio) {
    system(
      sprintf("ffmpeg  -f concat -safe 0 -i %s/clips_list.txt -an -c copy %s/%s", folder_in, folder_out, full_video_name)
            ) # does not keep the space escape
  }else{
    system(
      sprintf("ffmpeg  -f concat -safe 0 -i %s/clips_list.txt -c copy %s/%s", folder_in, folder_out, full_video_name)
    ) # does not keep the space escape
  }
  return(sprintf("%s/%s", folder_out, full_video_name))
}


# CLI - ffmpeg  -f concat -safe 0 -i /Users/julien/Data/Caves/Ped 1/09_16_23 1108 baseline/clips_list.txt -an -c copy /Users/julien/Data/Caves/Ped 1/09_16_23 1108 baseline/output_test_noaudio.mp4


