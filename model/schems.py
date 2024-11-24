class Schema:
    def __init__(self):
        self.tables = []
    def add_table(self, table_name):
        self.tables.append(table_name)

class Table:
    def __init__(self, name, columns):
        self.name = name
        self.columns = columns

class Column:
    def __init__(self, name, data_type):
        self.name = name
        self.data_type = data_type
