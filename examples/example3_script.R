library(dplyr)
library(magrittr)
library(tidytext)
library(textstem)

# Example 4

# Load the star_wars_scripts.rds dataset
df <- readRDS("data/star_wars_scripts.rds")

# Use {tidytext} to tokenize the star wars scripts, where a token is a single 
# word to create a one-token-per-row data frame. Also remove summary columns.
tidy_script <- df %>%
  select(-length, -ncap, -nexcl, -nquest, -nword) %>% # Remove summary cols
  unnest_tokens(output = word, input = dialogue) # Tokenise

#Stemming
tidy_script_stemmed <- tidy_script %>%
  anti_join(stop_words, by = "word") %>%
  mutate(word = stem_strings(word)) %>%
  count(word, sort = TRUE)

#Lemmatisation
tidy_script_lemma <- tidy_script %>%
  anti_join(stop_words, by = "word") %>%
  mutate(word = lemmatize_strings(word)) %>%
  count(word, sort = TRUE)

# removed power as a key word
# depends on the data to see what happens

# Stemming and Lemmatization both generate the root form of the inflected words. The difference is that stem might not be an actual word whereas, lemma is an actual language word. Stemming follows an algorithm with steps to perform on the words which makes it faster.


# Stemming and Lemmatization are Text Normalization techniques in the field of Natural Language Processing 
# that are used to prepare text, words, and documents for further processing. 
# Stemming and Lemmatization have been studied, and algorithms have been developed in Computer Science 
# since the 1960's. 
# 
