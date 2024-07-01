Map<String, dynamic> getDiseaseData(String diseaseType) {
    return diseaseData[diseaseType] ?? {};
}

Map<String, dynamic> diseaseData = {
      "Chickenpox": {
        "name": "Chickenpox",
        "description": "Chickenpox is a highly contagious viral infection causing an itchy, blister-like rash on the skin.",
        "cause": {
          "pathogen": "Varicella-zoster virus (VZV)",
          "transmission": [
            "Airborne respiratory droplets (coughs or sneezes)",
            "Direct contact with the rash or blister fluid",
            "From a pregnant mother to her baby (congenital varicella)"
          ]
        },
        "symptoms": {
          "initial": [
            "Fever",
            "Fatigue",
            "Loss of appetite",
            "Headache"
          ],
          "rash_development": [
            "Red spots",
            "Bumps",
            "Blisters",
            "Scabs"
          ],
          "complications": [
            "Bacterial infections of the skin",
            "Pneumonia",
            "Encephalitis",
            "Reye's syndrome (in children taking aspirin)"
          ]
        },
        "diagnosis": {
          "clinical_observation": "Appearance of the characteristic rash",
          "laboratory_tests": [
            "PCR test for VZV DNA",
            "Direct fluorescent antibody (DFA) test",
            "Serological tests for VZV antibodies"
          ]
        },
        "treatment": {
          "home_care": [
            "Rest",
            "Hydration",
            "Calamine lotion and colloidal oatmeal baths for itching",
            "Avoid scratching to prevent scarring and infection"
          ],
          "medical_treatment": [
            "Antiviral medications (e.g., acyclovir) for severe cases",
            "Pain relievers and fever reducers (avoid aspirin in children)"
          ]
        },
        "prevention": {
          "vaccination": "Varicella vaccine",
          "isolation": "Keep infected individuals away from non-immune people until blisters have crusted over"
        },
        "prognosis": "Most people recover fully without complications within 1-2 weeks. Immunity is typically lifelong, but the virus can reactivate later in life as shingles (herpes zoster).",
        "resources": {
          "websites": [
            {
              "name": "Centers for Disease Control and Prevention (CDC)",
              "url": "https://www.cdc.gov/chickenpox/"
            },
            {
              "name": "World Health Organization (WHO)",
              "url": "https://www.who.int/news-room/fact-sheets/detail/chickenpox"
            }
          ],
          "hotlines": [
            {
              "name": "CDC Info",
              "phone": "1-800-232-4636"
            }
          ]
        }
      },
      "Cowpox": {
        "name": "CowPox",
        "description": "Cowpox is a viral disease caused by the cowpox virus.",
        "cause": {
          "pathogen": "Cowpox virus"
        },
        "symptoms": {
          "initial": [
            "Fever",
            "Fatigue",
            "Headache"
          ],
          "rash_development": [
            "Redness",
            "Painful sores",
            "Lesions"
          ]
        },
        "diagnosis": {
          "clinical_observation": "Appearance of skin lesions",
          "laboratory_tests": [
            "PCR test for cowpox virus",
            "Serological tests for cowpox antibodies"
          ]
        },
        "treatment": {
          "home_care": [
            "Rest",
            "Hydration",
            "Pain relief medications"
          ],
          "medical_treatment": [
            "Supportive care"
          ]
        },
        "prevention": {
          "vaccination": "None available"
        },
        "prognosis": "Most cases resolve on their own within a few weeks.",
        "resources": {
          "websites": [
            {
              "name": "CDC",
              "url": "https://www.cdc.gov/cowpox/"
            }
          ],
          "hotlines": [
            {
              "name": "CDC Info",
              "phone": "1-800-232-4636"
            }
          ]
        }
      },
      "HFMD": {
        "name": "Hand, Foot, and Mouth Disease (HFMD)",
        "description": "HFMD is a common viral illness that usually affects infants and children younger than 5 years old.",
        "cause": {
          "pathogen": "Several enteroviruses, including Coxsackievirus A16 and Enterovirus 71"
        },
        "symptoms": {
          "initial": [
            "Fever",
            "Sore throat",
            "Malaise"
          ],
          "rash_development": [
            "Painful sores on the hands, feet, and mouth"
          ]
        },
        "diagnosis": {
          "clinical_observation": "Characteristic sores on hands, feet, and mouth",
          "laboratory_tests": [
            "Usually diagnosed clinically"
          ]
        },
        "treatment": {
          "home_care": [
            "Rest",
            "Hydration",
            "Pain relief medications",
            "Cold drinks and soft foods to soothe mouth sores"
          ],
          "medical_treatment": [
            "Supportive care"
          ]
        },
        "prevention": {
          "vaccination": "None available",
          "isolation": "Keep infected children home until fever is gone and sores have healed"
        },
        "prognosis": "Most children recover without medical treatment in 7-10 days.",
        "resources": {
          "websites": [
            {
              "name": "CDC",
              "url": "https://www.cdc.gov/hfmd/"
            }
          ],
          "hotlines": [
            {
              "name": "CDC Info",
              "phone": "1-800-232-4636"
            }
          ]
        }
      },
      "Measles": {
        "name": "Measles",
        "description": "Measles is a highly contagious viral infection that spreads through respiratory droplets.",
        "cause": {
          "pathogen": "Measles virus"
        },
        "symptoms": {
          "initial": [
            "High fever",
            "Cough",
            "Runny nose"
          ],
          "rash_development": [
            "Red, blotchy rash that starts on the face and spreads"
          ]
        },
        "diagnosis": {
          "clinical_observation": "Characteristic rash and symptoms",
          "laboratory_tests": [
            "Serological tests for measles antibodies",
            "PCR test for measles virus"
          ]
        },
        "treatment": {
          "home_care": [
            "Rest",
            "Hydration",
            "Fever reducers",
            "Comfort measures for cough and runny nose"
          ],
          "medical_treatment": [
            "Supportive care"
          ]
        },
        "prevention": {
          "vaccination": "MMR vaccine (Measles, Mumps, Rubella)",
          "isolation": "Keep infected individuals away from non-immune people"
        },
        "prognosis": "Most people recover within 1-2 weeks. Complications can occur, especially in young children and adults.",
        "resources": {
          "websites": [
            {
              "name": "CDC",
              "url": "https://www.cdc.gov/measles/"
            },
            {
              "name": "WHO",
              "url": "https://www.who.int/news-room/fact-sheets/detail/measles"
            }
          ],
          "hotlines": [
            {
              "name": "CDC Info",
              "phone": "1-800-232-4636"
            }
          ]
        }
      },
      "Monkeypox": {
        "name": "Monkeypox",
        "description": "Monkeypox is a rare viral disease that occurs mostly in remote parts of central and west Africa.",
        "cause": {
          "pathogen": "Monkeypox virus"
        },
        "symptoms": {
          "initial": [
            "Fever",
            "Headache",
            "Muscle aches"
          ],
          "rash_development": [
            "Skin lesions that evolve into pustules"
          ]
        },
        "diagnosis": {
          "clinical_observation": "Characteristic rash and symptoms",
          "laboratory_tests": [
            "PCR test for monkeypox virus",
            "Serological tests for monkeypox antibodies"
          ]
        },
        "treatment": {
          "home_care": [
            "Rest",
            "Hydration",
            "Pain relief medications"
          ],
          "medical_treatment": [
            "Supportive care"
          ]
        },
        "prevention": {
          "vaccination": "Smallpox vaccine (some cross-protection)",
          "isolation": "Keep infected individuals away from non-immune people"
        },
        "prognosis": "Most cases resolve within a few weeks without complications.",
        "resources": {
          "websites": [
            {
              "name": "CDC",
              "url": "https://www.cdc.gov/monkeypox/"
            }
          ],
          "hotlines": [
            {
              "name": "CDC Info",
              "phone": "1-800-232-4636"
            }
          ]
        }
      },
      "Healthy": {
        "name": "Healthy (Normal skin)",
        "description": "No specific disease detected. Maintain good hygiene and healthy habits for general well-being.",
        "treatment": {
          "recommendations": [
            "Regular physical activity",
            "Balanced diet",
            "Adequate sleep",
            "Hygiene practices (handwashing, dental care, etc.)"
          ]
        },
        "prognosis": "Maintaining healthy habits supports overall well-being and prevents diseases.",
        "motivation": "Maintain a healthy lifestyle to stay strong and happy!"
      }
    };