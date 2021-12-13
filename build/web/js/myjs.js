function doLike(pId, uid) {
    console.log(pId + " , " + uid);
    const d = {
        uid: uid,
        pId: pId,
        operation: 'like'
    }
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == 'true') {
                let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            }

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(error);
        }
    })

}