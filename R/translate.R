#' @rdname translate
#' @title Translate text between languages
#' @description Translate text between languages
#' @param text A character string containing a text
#' @param from A two-letter language code specifying the language of the source text.
#' @param to  two-letter language code specifying the language to translate in to.
#' @param \dots Additional arguments passed to \code{\link{translateHTTP}}.
#' @return A character string containing the translation.
#' @examples
#' \dontrun{
#' translate("hello world!", to = "fr")
#' }
#' @export
translate <- 
function(text,
         from = "en",
         to,
         ...)
{
    bod <- list(SourceLanguageCode = from,
                TargetLanguageCode = to,
                Text = text)
    out <- translateHTTP(query = list(Action = "TranslateText"), verb = "POST", body = bod, ...)$TranslatedText
    return(out)
}
