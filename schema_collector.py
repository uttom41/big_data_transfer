from collections import defaultdict
import json
from pyhive import hive

# Part collection and decoding logic
class SchemaCollector:
    def __init__(self):
        self.schema_parts = defaultdict(list)
        self.total_parts = {}

    def add_part(self, schema_id, part_number, total_parts, schema_data):
        # Store the part data
        self.schema_parts[schema_id].append((part_number, schema_data))
        
        # Track the total number of parts for the schema
        self.total_parts[schema_id] = total_parts

        # If all parts have been received, reassemble the full schema JSON
        if len(self.schema_parts[schema_id]) == total_parts:
            # Sort parts by part_number and concatenate them
            self.schema_parts[schema_id].sort(key=lambda x: x[0])
            full_schema_json = ''.join([part[1].decode('utf-8') for part in self.schema_parts[schema_id]])
            del self.schema_parts[schema_id]  # Clear the parts after reassembly
            return json.loads(full_schema_json)  # Return the reassembled JSON
        return None
