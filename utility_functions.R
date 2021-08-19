# Contains variables functions used regularly throughout the project.

# LOAD LIBRARIES
library(gridExtra) # combine multiple plots
library(scales) # Transformations


# VARIABLES
# Labels for graphs
subreddit_names <- c("ChangeMyView", "AltRightChristian", "Anarcho_Capitalism", "AskAConservative", "AverageRedditor", "Chodi",
                     "Conservative", "Conspiracy", "CringeAnarchy", "DonaldTrump",  "FemaleDatingStrategy", "GenderCritical",
                     "MetaCanada", "MGTOW", "MGTOW2", "MillionDollarExtreme", "ProtectAndServe", "The_Donald", "Tucker_Carlson","UnpopularOpinion")

# Color palette for graphs
color_palette <- c("#d73d64", "#70be49", "#cb72e1", "#589646", "#5f6bda",
                   "#d89b31","#8b4aac","#b2b050","#cf469f","#59c39e",
                   "#d35631","#4eacd7","#a1493d","#378562","#cd8bc9",
                   "#756f29","#6b7ec4","#c88651","#9d4b76","#e07e88")

# FUNCTIONS

# Function to read in data from storage
# ENSURE that the GCSFUSE disk is mounted first.
read_reddit_data <- function(subreddit_name) {
  path = paste0('../data/', subreddit_name)
  df <- read_feather(path)
  return(df)
}

# Function to write data into storage
write_reddit_data <- function(df, file_name) {
  path = paste0('../data/', file_name)
  df <- write_feather(df, path)
  print('Dataframe saved to disk')
}

# Function to perform common pre-processing functions across the posts dataset
pre_process_post_data <- function(subreddit_df) {
  preprocessed_df <- subreddit_df %>%
    # Remove bot, user deleted and moderator deleted posts
    filter(selftext != '[removed]', selftext != '[deleted]', author != 'AutoModerator') %>%
  return(preprocessed_df)
}

# Transformation for cubed root
cube_root <- function(x) x ^ (1/3)
cube <- function(x) x ^ 3

trans_cube <- trans_new(name = "cube root",
                        transform = cube_root,
                        inverse = cube)

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


