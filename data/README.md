# Telemedicine and Remote Patient Monitoring: Setting up Data for the Project

In this discussion, I will go over the sources, the stages of processing, and the configuration of the data so that it can be used for model training, testing, and benchmarking the model.

**We will be handling two types of datasets:**

1. Dataset of patients.
2. Dataset for training the models.

## Some of the Data Sources from where you can get data to train a LLM model.

Here are some sources where you can find datasets for training a Large Language Model (LLM) for medical purposes:

1. [**LLMDataHub**¹](https://github.com/Zjh-819/LLMDataHub): This repository provides a curated collection of datasets specifically designed for chatbot training, including links, size, language, usage, and a brief description of each dataset¹.

2. [**medAlpaca**²](https://github.com/kbressem/medAlpaca): This project offers an advanced suite of large language models specifically fine-tuned for medical question-answering and dialogue applications. The models have been trained using a variety of medical texts, encompassing resources such as medical flashcards, wikis, and dialogue datasets².

3. [**Open LLM datasets for pre-training**³](https://github.com/eugeneyan/open-llms): This is a list of open LLMs available for pre-training³.

4. [**PMC-LLaMA**⁴](https://arxiv.org/pdf/2304.14454): This project collected a large medical-specific corpus, named MedC-K, consisting of 4.8M biomedical academic papers and 30K textbooks for knowledge injection⁴.

Please note that while these sources provide datasets, you should ensure that the data is used in compliance with the terms and conditions specified by the data providers.