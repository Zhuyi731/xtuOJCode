/**
 * Created by Administrator on 2017/4/27.
 */
var total = 1;
function deleteProblem(sid) {
    if (total == 1) {
        alert("至少添加一个题目!");
        return;
    }
    var nodeToDelete = "line" + sid;
    var tbody = document.getElementById("problemSequence");
    var tr = document.getElementById(nodeToDelete);
    tbody.removeChild(tr);
    tr.innerHTML = "";
    total--;
    for (var i = sid + 1; i <= total + 1; i++) {
        var c = i - 1;
        var strId = "No" + i;
        var newId = "No" + c;
        //修改序号
        var node = document.getElementById(strId);
        node.innerHTML = c;
        node.setAttribute("id", newId);
        //修改行<tr>ID
        var trNode = document.getElementById("line" + i);
        trNode.setAttribute("id", "line" + c);
        var deleteNodeStr = "d" + i;
        var newDeleteNodeStr = "d" + c;
        var deleteNode = document.getElementById(deleteNodeStr);
        //修改button ID
        deleteNode.setAttribute("id", newDeleteNodeStr);
        deleteNode.setAttribute("onclick", "deleteProblem(" + c + ")");
        //修改input ID
        var input1 = document.getElementById("problemId" + i);
        input1.setAttribute("id", "problemId" + c);
        var input2 = document.getElementById("score" + i);
        input2.setAttribute("id", "score" + c);
        //修改addButton  sid
        var addNode = document.getElementById("addButton");
        addNode.setAttribute("onclick", "addProblem(" + total + ")");
    }

}
function addProblem(sid) {
    total++;
    if (sid >= 20) {
        alert("每场考试最多添加20个题目!");
    } else {
//        改变button onclick属性
        sid++;
        var str = "addProblem(" + sid + ")";
        var addbutton = document.getElementById("addButton");
        addbutton.setAttribute("onclick", str);
//        加入新的行
        var tbody = document.getElementById("problemSequence");
        var trId = "line" + sid;
        var newnode = document.createElement("tr");
        newnode.setAttribute("id", trId);
        tbody.appendChild(newnode);
        var newtr = document.getElementById(trId);

        //加入序号节点
        var newnode1 = document.createElement("td");
        newnode1.innerHTML = sid;
        var nodeId = "No" + sid;
        newnode1.setAttribute("id", nodeId);
        newtr.appendChild(newnode1);
        //加入input节点1
        var newnode2 = document.createElement("td");
        var newInput = document.createElement("input");
        var proId = "problemId" + sid;
        newInput.setAttribute("id", proId);
        newInput.setAttribute("type", "number");
        newnode2.appendChild(newInput);
        newtr.appendChild(newnode2);
        //加入input节点2
        var newnode3 = document.createElement("td");
        var newInput2 = document.createElement("input");
        var score = "score" + sid;
        newInput2.setAttribute("id", score);
        newInput2.setAttribute("type", "number");
        newnode3.appendChild(newInput2);
        newtr.appendChild(newnode3);
        //加入删除按钮
        var newnode4 = document.createElement("td");
        var newButton = document.createElement("button");
        newButton.setAttribute("class", "btn btn-danger btn-sm");
        var newDelete = "deleteProblem(" + sid + ")";
        newButton.innerHTML = "删除";
        newButton.setAttribute("onclick", newDelete);
        var newID = "d" + sid;
        newButton.setAttribute("id", newID);
        newnode4.appendChild(newButton);
        newtr.appendChild(newnode4);
    }
}
function next() {
    var title = document.getElementById("title");
    var part1 = document.getElementById("part1");
    var part2 = document.getElementById("part2");
    part1.style.display = 'none';
    part2.style.display = '';
}
function back() {
    var part1 = document.getElementById("part1");
    var part2 = document.getElementById("part2");
    part2.style.display = 'none';
    part1.style.display = '';
}
function check() {
    var requestStr="";
    var scoreSum=0;
    for (var i = 1; i <= total; i++) {
        var a = document.getElementById("problemId" + i).value;
        var b = document.getElementById("score" + i).value;
        if(a==""||b==""){
            alert("请将输入填写完整");
            return false;
        }
        scoreSum+=parseInt(b);
        if (i == 1) {
            requestStr += i + "TAT" + a + "TAT" + b;
        } else {
            requestStr += "QAQ" + i + "TAT" + a + "TAT" + b;
        }
    }
    if(scoreSum!=100){
        alert("分数之和为"+scoreSum+" 不为100!");
        return false;
    }
    document.getElementById("problemList").value=requestStr;
    var title = document.getElementById("title");
    var startTimeStr = document.getElementById("startTimeStr");
    var endTimeStr = document.getElementById("endTimeStr");
    if (title.value == "" || startTimeStr.value == "" || endTimeStr.value == "") {
        alert("请将选项填写完整");
        return false;
    } else {
        return true;
    }
}