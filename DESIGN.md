# Design Document

By YOUR NAME HERE
AgriTrack – Livestock & Product Traceability System

Video overview: <URL HERE>
https://youtu.be/1boq10ZMYKo
my canva design
https://www.canva.com/design/DAG3rmCC1vw/Hn73qhCtLCS_ly2MdYzrfQ/edit?utm_content=DAG3rmCC1vw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
The purpose of this database is to track livestock, their medical history, treatments, and sales from farms to end buyers. It enables better management of animal health, traceability of products, and data-driven insights for farmers and veterinarians.

* Which people, places, things, etc. are you including in the scope of your database?
• Farmers and their farms.
• Animals owned by each farmer.
• Medications and treatments given to animals.
• Health checks performed by veterinarians.
• Sales transactions of animals to buyers.Sales transactions of animals to buyers.• Sales transactions of animals to buyers.

* Which people, places, things, etc. are *outside* the scope of your database?
• Transportation and logistics after a sale.
• Feed management or nutrition tracking.
• Buyer satisfaction or post-sale monitoring.
• Financial accounting and billing systems.

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
• Register farmers and their animals.
• Record each animal’s treatments, medications, and health checks.
• Track animal sales and related information (buyer, price, date).
• Generate analytical insights such as:
• Most treated animals.
• Average number of health checks per farmer.
• Monthly total sales.
• Animals sold shortly after a treatment.

* What's beyond the scope of what a user should be able to do with your database?
• Editing or deleting data after transactions are finalized.
• Integration with external APIs or farm management apps.
• Automated veterinary diagnostics or disease prediction.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
(Farmers - Animals - Medications - Treatments - Health_Checks - Sales)

* What attributes will those entities have?
Each entity includes key identifiers and relevant attributes (e.g., animal_id, species, birth_date, status for animals; buyer_name, sale_date, price for sales).

* Why did you choose the types you did?
• IDs as INTEGER for indexing.
• Dates stored as DATE for temporal queries.
• Text fields (TEXT, VARCHAR) for descriptive attributes like names and diagnoses.
• Prices as REAL for calculations.

* Why did you choose the constraints you did?
(NOT NUL - UNIQUE - CHECK - )

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
• The system doesn’t handle transport or post-sale logistics.
• It assumes all farmers and veterinarians are trusted data sources.
• It doesn’t support multimedia (e.g., animal photos, medical documents).
• Large-scale performance (millions of rows) not yet optimized beyond indexes.

* What might your database not be able to represent very well?
• Disease spread between farms or environmental conditions.
• Non-animal agricultural products (like crops).
