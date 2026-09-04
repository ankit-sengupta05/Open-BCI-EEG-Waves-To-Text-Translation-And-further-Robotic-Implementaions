# EEG-to-Text and Speech Decoding Datasets

This document provides a comprehensive list of publicly available EEG datasets suitable for translating brain waves into text, mapping EEG to transcripts, and decoding speech.

## 1. ZuCo 1.0 (Zurich Cognitive Language Processing Corpus)

A dataset of simultaneous EEG and eye-tracking data recorded while participants read natural sentences. It includes normal reading and task-specific reading paradigms.

- **Link:** [https://osf.io/q3zws/](https://osf.io/q3zws/)
- **Use Case:** Natural reading decoding, word-level and sentence-level text mapping.
- **Data Structure & Mapping:** Provided as Matlab `.mat` files containing cell arrays of structs. Each struct corresponds to a specific sentence.
  - **Transcript Mapping:** The sentences are further broken down into word-level structs. The continuous EEG data is precisely segmented by word boundaries using the synchronized eye-tracking fixations (e.g., First Fixation Duration, Total Reading Time). This allows you to map specific segments of the EEG graph directly to individual word strings, as well as the full sentence transcript.

## 2. ZuCo 2.0

An extension of the ZuCo dataset providing more natural reading data, recorded to validate and expand upon the initial dataset.

- **Link:** [https://osf.io/2urht/](https://osf.io/2urht/)
- **Use Case:** Advanced EEG-to-text translation and cognitive language processing.
- **Data Structure & Mapping:** Follows the exact same Matlab `.mat` struct formatting as ZuCo 1.0.
  - **Transcript Mapping:** EEG time-series arrays are linked to word-level boundaries and sentence-level text labels via eye-tracking events.

## 3. JapanEEG (1000-hour Dataset)

A massive, large-scale, open-vocabulary dataset containing over 1000 hours of synchronized EEG, facial EMG, and audio data. It was recorded from participants performing overt Japanese speech production tasks.

- **Link:** [OpenNeuro ds007808](https://openneuro.org/datasets/ds007808)
- **Use Case:** Representation learning, continuous speech decoding, and brain-computer interface (BCI) research.
- **Data Structure & Mapping:** Follows the Brain Imaging Data Structure (BIDS) standard. Data consists of continuous EEG files (`.set`/`.edf`) paired with tabular `.tsv` event files.
  - **Transcript Mapping:** The `events.tsv` file contains precise timestamp intervals (onset and duration in seconds) for each spoken word, phoneme, or sentence. You use these timestamps to slice the continuous EEG time-series graph, mapping the sliced graph segment to the corresponding textual transcript in the event file.

## 4. Open-Access EEG Dataset for Speech Decoding (Moreira et al.)

Contains 64-channel EEG recordings from participants listening to speech sounds (single phonemes, phoneme pairs, and real/pseudo-words). It explores articulation and coarticulation effects on neural decoding.

- **Link:** [OpenNeuro ds006104](https://openneuro.org/datasets/ds006104)
- **Use Case:** Phoneme discrimination, syllable classification, and auditory speech decoding.
- **Data Structure & Mapping:** Standard BIDS format (continuous EEG formats and `events.tsv` tables).
  - **Transcript Mapping:** The event files mark the exact millisecond an auditory stimulus (the phoneme or word) was presented. The continuous EEG graph is epoched (segmented) relative to these event markers (e.g., -200ms to 800ms relative to stimulus onset), mapping the specific brainwave segment to the phoneme string label.

## 5. Kara-One Dataset

A popular dataset for speech-related BCI research. It features EEG data collected while subjects performed imagined and vocalized phonemic and single-word prompts, accompanied by audio and face-tracking data.

- **Link:** [Kara-One Project Page](http://individual.utoronto.ca/mrezazad/KaraOne/)
- **Use Case:** Imagined speech decoding, isolated word and phoneme translation.
- **Data Structure & Mapping:** Distributed as Python-compatible `.npy` arrays or Matlab `.mat` files containing pre-segmented trial data.
  - **Transcript Mapping:** The continuous EEG data is already sliced into distinct trials. Each trial represents a state machine: Rest -> Stimulus Cue (Text on screen) -> Imagined Speech -> Vocalized Speech. The EEG time-series arrays for the "imagined" and "vocalized" segments are mapped to one of 11 strict textual labels (e.g., phonemes like /iy/, /uw/, or words like "pat", "pot").

## 6. Simanova et al. EEG Language Dataset

Investigates semantic processing across various modalities, including written words, spoken words, and pictures.

- **Link:** [MPI for Psycholinguistics Archive](https://hdl.handle.net/1839/00-0000-0000-0014-1C04-2) (Often used in FieldTrip tutorials)
- **Use Case:** Semantic decoding and modality-independent language representation.
- **Data Structure & Mapping:** FieldTrip-compatible `.mat` structs.
  - **Transcript Mapping:** The data is provided as pre-segmented epochs (trials) around the presentation of the stimulus. Each trial's EEG graph segment is labeled with both the specific textual word presented and its semantic category class (e.g., animal, tool).

## Additional Repositories

- **OpenNeuro (https://openneuro.org):** A free and open platform for sharing MRI, MEG, EEG, iEEG, and ECoG data. Searching for "speech" or "language" yields many specific experiments.
- **NEMAR (https://nemar.org):** The Neuroelectromagnetic Data Archive and Tools Resource, useful for finding M/EEG data related to cognitive tasks.

---

### Best Practices for Dataset Selection

- **Natural Reading Translation:** For mapping reading processes directly to text, **ZuCo 1.0** and **ZuCo 2.0** are the gold standards.
- **Word/Phoneme Classification:** For isolated text or imagined speech, start with **Kara-One** or the **Moreira et al. dataset**.
- **Large-Scale Continuous Speech:** If training deep representation models, the 1000-hour **JapanEEG** dataset offers the necessary scale.
