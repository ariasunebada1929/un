function ClickRadio() {
    radio = document.getElementsByName('CreateIDGroup')
    if (radio[0].checked) {
        document.getElementById('id_CompanyForm').style.display = "";
        document.getElementById('id_PersonalForm').style.display = "none";
    } else if (radio[1].checked) {
        //フォーム
        document.getElementById('id_CompanyForm').style.display = "none";
        document.getElementById('id_PersonalForm').style.display = "";
    }
}
window.onload = ClickRadio;