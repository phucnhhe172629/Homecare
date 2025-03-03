document.addEventListener("DOMContentLoaded", function () {
    // Khai báo dữ liệu cho các phòng
    const roomData = {
        kitchen: {
            title: "Nhà bếp",
            image: "../images/deep-cleaning-nha-bep.png",
            tasks: [
                "- Rửa chén và xếp chén đĩa",
                "- Lau bụi và lau tất cả các bề mặt có thể tiếp cận",
                "- Lau mặt ngoài của tủ bếp, các thiết bị gia dụng",
                "- Lau các công tắc và tay cầm",
                "- Cọ rửa bếp",
                "- Lau mặt bàn",
                "- Làm sạch bồn rửa",
                "- Đổ rác",
                "- Quét và lau sàn nhà"
            ]
        },
        bathroom: {
            title: "Phòng tắm",
            image: "../images/deep-cleaning-nha-tam.png",
            tasks: [
                "- Cọ rửa bồn cầu, bồn rửa tay",
                "- Lau kính và gương",
                "- Làm sạch vòi nước và vòi sen",
                "- Lau sàn nhà",
                "- Thay khăn tắm mới"
            ]
        },
        livingroom: {
            title: "Phòng khách và khu vực chung",
            image: "../images/deep-cleaning-ve-sinh-chung.png",
            tasks: [
                "- Lau bụi trên bàn, kệ, tivi",
                "- Hút bụi thảm, ghế sofa",
                "- Lau công tắc điện, tay nắm cửa",
                "- Dọn gọn sách, điều khiển tivi",
                "- Quét và lau sàn nhà"
            ]
        },
        bedroom: {
            title: "Phòng ngủ",
            image: "../images/deep-cleaning-phong-ngu.png",
            tasks: [
                "- Gấp chăn, sắp xếp gối",
                "- Lau bụi trên tủ, bàn làm việc",
                "- Thay ga giường, vỏ gối",
                "- Hút bụi sàn nhà",
                "- Lau kính cửa sổ"
            ]
        }
    };

    // Hàm thay đổi nội dung khi nhấn tab
    function changeTab(room) {
        // Cập nhật tiêu đề và hình ảnh
        document.getElementById("room-title").textContent = roomData[room].title;
        document.getElementById("room-image").src = roomData[room].image;

        // Cập nhật danh sách công việc
        const taskList = document.getElementById("room-tasks");
        taskList.innerHTML = "";
        roomData[room].tasks.forEach(task => {
            const li = document.createElement("li");
            li.textContent = task;
            taskList.appendChild(li);
        });

        // Cập nhật tab active
        document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));
        document.querySelector(`button[onclick="changeTab('${room}')"]`).classList.add("active");
    }

    // Đặt sự kiện mặc định khi trang tải lên
   /* changeTab('kitchen');*/

    // Cập nhật sự kiện cho các tab
    document.querySelectorAll('.tab').forEach(tab => {
        tab.addEventListener('click', function () {
            const room = this.getAttribute('onclick').split("'")[1];
            changeTab(room);
        });
    });
});
