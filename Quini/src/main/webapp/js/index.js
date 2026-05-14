const initLotteryBtn = document.getElementById("initLotteryBtn");
const lotteryNumberList = document.getElementById("lotteryNumberList");
let drawIntervalId = null;


initLotteryBtn.addEventListener("click", async (e) => {
    if (drawIntervalId) return;

    initLotteryBtn.disabled = true;
    lotteryNumberList.innerHTML = "";

    const startResponse = await fetch("actions/startLottery.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"}
    });

    if (!startResponse.ok) {
        initLotteryBtn.disabled = false;
        throw new Error(startResponse.statusText);
    }

    drawIntervalId = setInterval(async () => {
        const response = await fetch("actions/generateNumber.jsp", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"}
        });

        if (!response.ok) {
            clearInterval(drawIntervalId);
            drawIntervalId = null;
            initLotteryBtn.disabled = false;
            throw new Error(response.statusText);
        }

        const html = await response.text();

        if (!html.trim()) {
            clearInterval(drawIntervalId);
            drawIntervalId = null;
            initLotteryBtn.disabled = false;
            return;
        }

        lotteryNumberList.insertAdjacentHTML("beforeend", html);
    }, 2000);

})
