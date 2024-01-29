function doLike(pid, uid, likeCounter) {
    console.log(pid + "," + uid);
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == 'true') {
                let c = parseInt(likeCounter.html()); // Get current count as an integer
                c++; // Increment the count
                likeCounter.html(c); // Update the specific like counter
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}
