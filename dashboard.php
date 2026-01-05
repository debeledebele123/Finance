<?php
require_once "../config/db.php";

// TOTAL STUDENTS
$total_students = $conn->query("SELECT COUNT(*) as total FROM students")->fetch_assoc()['total'];

// PAID STUDENTS
$paid_students = $conn->query("SELECT COUNT(DISTINCT student_id) as total FROM payments WHERE status='Confirmed'")->fetch_assoc()['total'];

// UNPAID STUDENTS
$unpaid_students = $total_students - $paid_students;

// TOTAL CLASSES
$total_classes = $conn->query("SELECT COUNT(*) as total FROM classes")->fetch_assoc()['total'];
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - School System Finance</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>School System Finance Dashboard</h1>

    <div class="stats">
        <div class="card total">
            <h3>Total Students</h3>
            <p><?php echo $total_students; ?></p>
        </div>
        <div class="card paid">
            <h3>Paid Students</h3>
            <p><?php echo $paid_students; ?></p>
        </div>
        <div class="card unpaid">
            <h3>Unpaid Students</h3>
            <p><?php echo $unpaid_students; ?></p>
        </div>
        <div class="card classes">
            <h3>Total Classes</h3>
            <p><?php echo $total_classes; ?></p>
        </div>
    </div>

    <h2>Quick Links</h2>
    <ul class="quick-links">
        <li><a href="../students/list.php">Students</a></li>
        <li><a href="../finance/history.php">Finance</a></li>
        <li><a href="../health/view.php">Health</a></li>
    </ul>

    <h2>Payments Overview</h2>
    <canvas id="paymentsChart" width="400" height="200"></canvas>

    <script>
        const ctx = document.getElementById('paymentsChart').getContext('2d');
        const paymentsChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Paid', 'Unpaid'],
                datasets: [{
                    label: 'Student Payments',
                    data: [<?php echo $paid_students; ?>, <?php echo $unpaid_students; ?>],
                    backgroundColor: ['#28a745', '#dc3545'],
                    borderColor: ['#fff', '#fff'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    </script>
</body>
</html>
