/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let asynData = function (id, embox, sgbtn) {
    let span = document.getElementById(embox);
    span.innerHTML = null;
    let fdata = document.getElementById(id).value;
    let btn = document.getElementById(sgbtn);
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jObj = JSON.parse(xhr.responseText);
                if (jObj.message === "Email already exists") {
                    btn.disabled = true;
                    span.innerHTML = jObj.message;
                    span.className = "form-text text-end text-danger small mt-1 d-block";
                } else if (jObj.message === "") {
                    btn.disabled = false;
                    span.innerHTML = null;
                } else {
                    btn.disabled = false;
                    span.innerHTML = jObj.message;
                    span.className = "form-text text-end text-success small mt-1 d-block";
                }
            } else {
                alert("Request is unsuccessful");
            }
        }
    };
    let url = "http://localhost:8080/pixelmart/fc/emailchecker?email=" + fdata;
    xhr.open("GET", url, true);
    xhr.send(null);
};
let sinform = function (fdiv) {
    let formdiv = document.getElementById(fdiv);
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jsonobj = JSON.parse(xhr.responseText);
                let form = document.createElement(jsonobj.component);
                form.action = jsonobj.action;
                form.method = jsonobj.method;
                form.className = jsonobj.class;
                let div1 = document.createElement("div");
                div1.className = "col-md-8 my-2";
                let input1 = document.createElement("input");
                input1.type = jsonobj.fields[0].type;
                input1.className = jsonobj.fields[0].class;
                input1.placeholder = jsonobj.fields[0].placeholder;
                input1.name = jsonobj.fields[0].name;
                input1.required = true;
                let div2 = document.createElement("div");
                div2.className = "col-md-8 my-2";
                let input2 = document.createElement("input");
                input2.type = jsonobj.fields[1].type;
                input2.className = jsonobj.fields[1].class;
                input2.placeholder = jsonobj.fields[1].placeholder;
                input2.name = jsonobj.fields[1].name;
                input2.required = true;
                let div3 = document.createElement("div");
                div3.className = "col-md-8 my-2 text-center";
                let achr = document.createElement("a");
                achr.href = "sellersignin";
                achr.textContent = "Are you a seller?";
                let div4 = document.createElement("div");
                div4.className = "row col-md-8 my-2 justify-content-center";
                let input4 = document.createElement("input");
                input4.type = jsonobj.fields[2].type;
                input4.value = jsonobj.fields[2].value;
                input4.className = jsonobj.fields[2].class;
                div1.append(input1);
                div2.append(input2);
                div3.append(achr);
                div4.append(input4);
                form.append(div1);
                form.append(div2);
                form.append(div3);
                form.append(div4);
                formdiv.append(form);
            }
        }
    };
    let url = "http://localhost:8080/pixelmart/fc/signinform";
    xhr.open("GET", url, true);
    xhr.send(null);
};
let loadCategories = function (category) {
    let cat = document.getElementById(category);
    console.log("Request categories...");
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jArr = JSON.parse(xhr.responseText);
                jArr.forEach(obj => {
                    let option = document.createElement("option");
                    option.value = obj.id;
                    option.textContent = obj.name;
                    cat.append(option);
                });
            } else {
                alert("Request is unsuccessful");
            }
        }
    };
    let url = "http://localhost:8080/pixelmart/fc/prodcat";
    xhr.open("GET", url, true);
    xhr.send(null);
};
let loadSubcategories = function (catid, subcategory) {
    let subcat = document.getElementById(subcategory);
    subcat.innerHTML = "<option value='' selected disabled>Loading...</option>";
    subcat.disabled = true;
    if (!catid) {
        subcat.innerHTML = "<option value='' selected disabled>Select Subcategory</option>";
        return;
    }
    console.log("Request subcategories...");
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jArr = JSON.parse(xhr.responseText);
                subcat.innerHTML = "<option value='' selected disabled>Select Subcategory</option>";
                if (jArr.length === 0) {
                    subcat.innerHTML = "<option value='' selected disabled>No subcategories found</option>";
                    return;
                }

                jArr.forEach(obj => {
                    let option = document.createElement("option");
                    option.value = obj.id;
                    option.textContent = obj.name;
                    subcat.append(option);
                });
                subcat.disabled = false;
            } else {
                alert("Request is unsuccessful");
            }
        }
    };
    let url = "http://localhost:8080/pixelmart/fc/prodsubcat?catid=" + catid;
    xhr.open("GET", url, true);
    xhr.send(null);
};
let loadProducts = function () {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jarr = JSON.parse(xhr.responseText);
                let cards = jarr.map((obj, index) =>
                    React.createElement(
                            "div", {
                                className: "card m-1 shadow-sm",
                                style: {width: "18rem"},
                                key: index
                            },
                            React.createElement(
                                    "a", {
                                        className: "text-decoration-none text-dark",
                                        href: "proddisp"
                                    },
                                    React.createElement(
                                            "div", {
                                                style: {height: "18rem"},
                                                className: "d-flex align-items-center justify-content-center p-1"
                                            },
                                            React.createElement(
                                                    "img", {
                                                        src: `data:image/${obj.type};base64,${obj.product_image_data}`,
                                                        width: "800",
                                                        className: "img-fluid",
                                                        alt: `${obj.product_name}`
                                                    })
                                            ),
                                    React.createElement(
                                            "div", {
                                                className: "card-body"
                                            },
                                            React.createElement("h5", {className: "card-title"}, obj.product_name),
                                            //React.createElement("h6", {className: "card-text"}, obj.product_brand),
                                            React.createElement("h6", {className: "card-text"}, "₹" + obj.product_selling_price),
                                            React.createElement("p", {className: "card-text"}, obj.product_description)
                                            )
                                    )
                            )
                );
                let container = React.createElement("div", {className: "d-flex flex-wrap justify-content-center"}, cards);
                ReactDOM.render(container, document.getElementById("products"));
            }
        }
    };
    let url = "http://localhost:8080/pixelmart/fc/prodld";
    xhr.open("GET", url, true);
    xhr.send(null);
};
function navbtn() {
    let page = document.body.getAttribute("id");
    let button = null;
    if (page === "index") {
        button = React.createElement(
                "button", {
                    className: "btn btn-light shadow-none col-md-6 my-3",
                    type: "button",
                    'data-bs-toggle': "modal",
                    'data-bs-target': "#signupmodal"
                }, "Sign Up");
    } else if (page === "welcome") {
        button = React.createElement(
                "div", null,
                // Cart Button
                React.createElement(
                        "button", {
                            className: "btn btn-light shadow-none m-2",
                            type: "button"
                        }, React.createElement(
                        "i", {
                            className: "bi bi-cart-fill me-1"
                        }),
                        "Cart"
                        ),
                // Account Button
                React.createElement(
                        "a", {
                            href: "index",
                            className: "btn btn-light shadow-none m-2"
                        },
                        React.createElement(
                                "i", {
                                    className: "bi bi-person-fill me-1"
                                }),
                        "Account"
                        ));
    } else if (page === "adminpg") {
        button = React.createElement(
                "a", {
                    href: "index",
                    className: "btn btn-light shadow-none col-md-6 my-3"
                }, "Logout");
    } else if (page === "buyerpg") {
        button = React.createElement(
                "a", {
                    href: "index",
                    className: "btn btn-light shadow-none col-md-6 my-3"
                }, "Logout");
    } else if (page === "invalidpg") {
        button = React.createElement(
                "a", {
                    href: "index",
                    className: "btn btn-light shadow-none my-3"
                }, "Back to Home");
    } else if (page === "sellerpg") {
        button = React.createElement(
                "a", {
                    href: "sellersignin",
                    className: "btn btn-light shadow-none col-md-6 my-3"
                }, "Logout");
    } else if (page === "slrsigninpg") {
        button = React.createElement(
                "a", {
                    href: "index",
                    className: "btn btn-light shadow-none my-3"
                }, "Buyer Sign In");
    }
    return button;
}

ReactDOM.render(React.createElement(navbtn, null, null), document.getElementById("navbutton"));