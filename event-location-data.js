db = db.getSiblingDB('ezyevents');
db.createCollection('events-location');

db.getCollection('events-location').insertMany(
    [{
       
        "id": "ab54a04e-fd38-11ed-ac8f-acde48001122",
        "location": {
          "type": "Point",
          "coordinates": [
            -93.99781444423192,
            44.148409843010036
          ]
        }
      },
      {
        
        "id": "bc083e5a-fd38-11ed-ac8f-acde48001122",
        "location": {
          "type": "Point",
          "coordinates": [
            -93.99852663197638,
            44.14805060081124
          ]
        }
      },
      {
        
        "id": "c928b2c2-fd38-11ed-ac8f-acde48001122",
        "location": {
          "type": "Point",
          "coordinates": [
            -93.99991986395847,
            44.14669111223655
          ]
        }
      },
      {
       
        "id": "d0b866b8-fd38-11ed-ac8f-acde48001122",
        "location": {
          "type": "Point",
          "coordinates": [
            -93.99842855578945,
            44.145459327822856
          ]
        }
      },
      {
        
        "id": "d8a9c0ec-fd38-11ed-ac8f-acde48001122",
        "location": {
          "type": "Point",
          "coordinates": [
            -93.99558824831934,
            44.14557397656344
          ]
        }
      },
      {
        
        "id": "7c45df12-7ba9-11ee-9dc0-acde48001122",
        "location": {
          "type": "Point",
          "coordinates": [
            -93.99991986395847,
            44.14669111223655
          ]
        }
      }]
);

db.getCollection('events-location').createIndex({location:"2dsphere"});