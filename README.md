# AgriTrack – Livestock & Product Traceability System 🐄📊

AgriTrack is a relational database system designed to **track livestock, medical history, treatments, and sales** from farms to end buyers. It empowers farmers, veterinarians, and stakeholders with **data-driven insights** for better decision-making, improved animal health, and transparent product traceability.

---

## 📌 Features

- Register **farmers** and their **animals**  
- Record **treatments, medications, and health checks**  
- Track **sales transactions** (buyer, price, date)  
- Generate **analytical insights**, such as:
  - Most treated animals  
  - Average number of health checks per farmer  
  - Monthly total sales  
  - Animals sold shortly after treatment  

---

## 🗄️ Database Schema

The database consists of six main entities:

| Entity          | Description |
|-----------------|-------------|
| **Farmers**     | Stores farmer details (name, location, contact info) |
| **Animals**     | Tracks species, birth date, health status, and ownership |
| **Medications** | Catalog of vaccines, antibiotics, and other treatments |
| **Treatments**  | Records administered medications, dosage, and vet info |
| **Health_Checks** | Logs diagnoses and recommendations by veterinarians |
| **Sales**       | Tracks animal sales, buyer details, and prices |

📂 See full schema: [schema.sql](./schema.sql)

### Entity Relationship Diagram

```mermaid
erDiagram
    farmers ||--o{ animals : "has"
    animals ||--o{ treatments : "receives"
    animals ||--o{ health_check : "undergoes"
    animals ||--o{ sales : "sold_in"
    medications ||--o{ animals : "prescribed_to"
    medications ||--o{ treatments : "used_in"
    
    farmers {
        INTEGER id PK
        TEXT first_name
        TEXT last_name
        TEXT location
        INTEGER phone_number UK
        TEXT email UK
    }
    
    animals {
        INTEGER id PK
        INTEGER farmer_id FK
        TEXT species
        DATETIME birth_date
        TEXT is_diseased
        TEXT is_alive
        TEXT is_sold
        DATETIME diseased_date
        TEXT disease_name
        INTEGER n_children
        INTEGER medication_id FK
    }
    
    medications {
        INTEGER id PK
        TEXT name
        TEXT type
        TEXT manufacturer
    }
    
    treatments {
        INTEGER id PK
        INTEGER animal_id FK
        INTEGER medication_id FK
        DATETIME date_administered
        INTEGER dosage
        TEXT vet_name
    }
    
    health_check {
        INTEGER id PK
        INTEGER animal_id FK
        DATETIME check_date
        TEXT diagnosis
        TEXT recommendations
    }
    
    sales {
        INTEGER id PK
        INTEGER animal_id FK
        TEXT buyer_name
        DATETIME sale_date
        INTEGER price
    }
