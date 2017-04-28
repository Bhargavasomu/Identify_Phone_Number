# Identify_Phone_Number
Given the audio files of each digit individually and the overall aduio file for the full number, this program uses Fourier Transform to identify the phone number dialled.
It is basically a function with following definition:
  function[number] = Eavesdrop(audiofilename)
This function should take in an audio file and return the number dialed. For example:
>> Eavesdrop(Police.ogg);
   100
