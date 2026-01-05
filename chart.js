const ctxBar = document.getElementById('classPaymentsChart').getContext('2d');
const classPaymentsChart = new Chart(ctxBar, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($class_labels); ?>,
        datasets: [
            {
                label: 'Paid',
                data: <?php echo json_encode($paid_counts); ?>,
                backgroundColor: '#28a745'
            },
            {
                label: 'Unpaid',
                data: <?php echo json_encode($unpaid_counts); ?>,
                backgroundColor: '#dc3545'
            }
        ]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'top'
            },
            title: {
                display: true,
                text: 'Student Payments Per Class'
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                stepSize: 1
            }
        }
    }
});
