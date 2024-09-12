    $(document).ready(function () {
         // Function to set data-labels on table cells
        function setTableDataLabels() {
            // Get all table headers
            var headers = $("table th");
            // Iterate over each row in the table body
            $("table tbody tr").each(function () {
                var $cells = $(this).find("td");
                // Iterate over each cell in the row
                $cells.each(function (index) {
                    // Set data-label attribute based on the corresponding header
                    if (headers[index]) {
                        $(this).attr("data-label", $(headers[index]).text().trim());
                    }
                });
            });
        }

        // Call the function to set data-labels
        setTableDataLabels();
    });
