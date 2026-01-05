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

// Payments per class
$classes_result = $conn->query("SELECT id, class_name FROM classes");
$class_labels = [];
$paid_counts = [];
$unpaid_counts = [];

while ($row = $classes_result->fetch_assoc()) {
    $class_id = $row['id'];
    $class_name = $row['class_name'];
    $class_labels[] = $class_name;

    $total_students_class = $conn->query("SELECT COUNT(*) as total FROM students WHERE class_id = $class_id")->fetch_assoc()['total'];
    $paid_students_class = $conn->query("SELECT COUNT(DISTINCT student_id) as total FROM payments 
                                         JOIN students ON payments.student_id = students.id
                                         WHERE payments.status='Confirmed' AND students.class_id = $class_id")->fetch_assoc()['total'];
    $unpaid_students_class = $total_students_class - $paid_students_class;

    $paid_counts[] = $paid_students_class;
    $unpaid_counts[] = $unpaid_students_class;
}
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
        <li><a href="#">Students</a></li>
        <li><a href="#">Finance</a></li>
        <li><a href="#">Health</a></li>
    </ul>

    <h2>Payments Overview</h2>
    <div class="chart-container">
        <canvas id="paymentsChart"></canvas>
    </div>

    <h2>Payments Per Class</h2>
    <div class="chart-container-bar">
        <canvas id="classPaymentsChart"></canvas>
    </div>

    <script>
        const ctx = document.getElementById('paymentsChart').getContext('2d');
        const paymentsChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Paid', 'Unpaid'],
                datasets: [{
                    data: [<?php echo $paid_students; ?>, <?php echo $unpaid_students; ?>],
                    backgroundColor: ['#28a745', '#dc3545'],
                    borderColor: ['#fff', '#fff'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { position: 'bottom' } }
            }
        });

        const ctxBar = document.getElementById('classPaymentsChart').getContext('2d');
        const classPaymentsChart = new Chart(ctxBar, {
            type: 'bar',
            data: {
                labels: <?php echo json_encode($class_labels); ?>,
                datasets: [
                    { label: 'Paid', data: <?php echo json_encode($paid_counts); ?>, backgroundColor: '#28a745' },
                    { label: 'Unpaid', data: <?php echo json_encode($unpaid_counts); ?>, backgroundColor: '#dc3545' }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { position: 'top' }, title: { display: true, text: 'Student Payments Per Class' } },
                scales: { y: { beginAtZero: true, stepSize: 1 } }
            }
        });
    </script>
</body>
</html>
