import psutil
from flask import Flask, render_template, jsonify

app = Flask(__name__)

def get_pid_by_name(process_name):
    """Find the PID of a process by its name."""
    for proc in psutil.process_iter(['pid', 'name']):
        try:
            if process_name.lower() in proc.info['name'].lower():
                return proc.info['pid']
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    return None

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get_usage')
def get_usage():
    service_name = "htop"  # Replace with your service name
    pid = get_pid_by_name(service_name)
    
    if pid:
        try:
            process = psutil.Process(pid)
            # Get CPU and memory usage
            cpu_usage = process.cpu_percent(interval=1)
            memory_info = process.memory_info()
            memory_usage = memory_info.rss  # in bytes

            return jsonify({
                'cpu': cpu_usage,
                'memory': memory_usage / (1024 * 1024)  # Convert to MB
            })
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            return jsonify({'error': f"Process with PID {pid} not accessible"})
    else:
        return jsonify({'error': f"Service '{service_name}' not found"})

if __name__ == '__main__':
    app.run(debug=True)
