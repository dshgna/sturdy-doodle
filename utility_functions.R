# Contains functions used regularly throughout the project.

# Function to read in data from storage 
read_reddit_data <- function(subreddit_name) {
  path = paste0('../data/', subreddit_name)
  df <- read_feather(path)
  return(df)
}


# Find tokens which have over a given no of characters
# cmv_spacy_tokens %>%
#   subset(nchar(token) > 20)


# Frequencies of features in a dfm
# featfreq(cmv_text_dfm)

# Scaling
# scale(k_search_output$results$K, center = TRUE, scale = TRUE)



# textstat_summary
# cmv_text_summary <- textstat_summary(cmv_text_corpus)
# Extract indices of documents from textstat_summary
# idx <- which(cmv_text_summary$urls > 0)




# Intermediary tests

# Find the POS tag of a given token
# cmv_spacy_tokens %>%
#   subset(token == "disproportionately")



# Find unique tokens for a given POS tag
# cmv_spacy_tokens %>%
  #   subset(pos == "ADV") %>%
  #   group_by(lemma) %>%
  #  summarize(count = n()) %>%
  #   arrange(desc(count))

# Test corpus
# txt <- c(doc1 = "Minorities were targeted disproportionately.", 
#          doc2 = "This literally makes no sense.",
#          doc3 = "Tell me when you just come" )
# spacy_parse(txt, tag = TRUE)



# Find how a token is located within a document
# kwic(cmv_spacy_tokens %>% as.tokens(use_lemma = TRUE), pattern = "%", valuetype = "regex", window = 10)


