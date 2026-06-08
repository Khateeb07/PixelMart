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
let signform = function (fdiv) {
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
    let url = "http://localhost:8080/pixelmart/fc/prodcat?type=json";
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
    let url = `http://localhost:8080/pixelmart/fc/prodsubcat?catid=${catid}&type=json`;
    xhr.open("GET", url, true);
    xhr.send(null);
};

//Product Cards on Welcome
let loadProducts = function (type, target) {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jarr = JSON.parse(xhr.responseText);
                let cards = jarr.map((obj, index) => React.createElement(
                            "div",
                            {
                                className: "col-lg-3 col-md-4 col-sm-6 mb-4",
                                key: index
                            },
                            React.createElement(
                                    "a",
                                    {
                                        href: `proddtls?pid=${obj.product_id}&sid=${obj.product_subcategory_id}`,
                                        className: "text-decoration-none text-dark"
                                    },
                                    React.createElement(
                                            "div",
                                            {
                                                className: "card trending-card h-100 border-0"
                                            },
                                            // Product Image
                                            React.createElement(
                                                    "div",
                                                    {
                                                        className:
                                                                "d-flex justify-content-center align-items-center"
                                                    },
                                                    React.createElement(
                                                            "img",
                                                            {
                                                                src: `data:image/${obj.type};base64,${obj.product_image_data}`,
                                                                alt: obj.product_name,
                                                                className: "trending-img"
                                                            }
                                                    )
                                                    ),
                                            // Product Body
                                            React.createElement(
                                                    "div",
                                                    {
                                                        className: "card-body"
                                                    },
                                                    React.createElement(
                                                            "h6",
                                                            {
                                                                className: "fw-bold mb-1"
                                                            },
                                                            obj.product_name
                                                            ),
                                                    React.createElement(
                                                            "small",
                                                            {
                                                                className: "text-muted"
                                                            },
                                                            obj.product_brand
                                                            ),
                                                    React.createElement(
                                                            "div",
                                                            {
                                                                className: "mt-2 text-warning"
                                                            },
                                                            "⭐⭐⭐⭐"
                                                            ),
                                                    React.createElement(
                                                            "div",
                                                            {
                                                                className: "mt-2"
                                                            },
                                                            React.createElement(
                                                                    "span",
                                                                    {
                                                                        className: "discount-badge"
                                                                    },
                                                                    `${obj.product_discount}% OFF`
                                                                    )
                                                            ),
                                                    React.createElement(
                                                            "h5",
                                                            {
                                                                className: "fw-bold mt-3 mb-0 text-success"
                                                            },
                                                            "$" + obj.product_selling_price
                                                            )
                                                    )
                                            )
                                    )
                            )
                );
                let container = React.createElement(
                        "div",
                        {
                            className: "container"
                        },
                        React.createElement(
                                "div",
                                {
                                    className: "row"
                                },
                                cards
                                )
                        );
                ReactDOM.render(container, document.getElementById(target));
            }
        }
    };
    xhr.open("GET", "http://localhost:8080/pixelmart/fc/prodld?type=" + type, true);
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
    } else if (page === "welcome" || page === "subcategorypg" || page === "productdisplaypg") {
        button = React.createElement(
                "div", {
                    className: "d-flex justify-content-end align-items-center"
                },
                // Cart Button
                React.createElement(
                        "button", {
                            className: "btn btn-outline-light rounded-pill px-3 me-2",
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
                            className: "btn btn-outline-light rounded-pill px-3"
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
                    className: "btn btn-light shadow-none my-2"
                }, "Logout");
    } else if (page === "buyerpg") {
        button = React.createElement(
                "a", {
                    href: "index",
                    className: "btn btn-light shadow-none my-2"
                }, "Logout");
    } else if (page === "invalidpg") {
        button = React.createElement(
                "a", {
                    href: "index",
                    className: "btn btn-light shadow-none my-2"
                }, "Back to Home");
    } else if (page === "sellerpg") {
        button = React.createElement(
                "a", {
                    href: "sellersignin",
                    className: "btn btn-light shadow-none my-2"
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

let fetchApiImportProducts = function () {
    let spinner = document.getElementById("importSpinner");
    let status = document.getElementById("importStatus");
    spinner.classList.remove("d-none");
    status.innerHTML = "";
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            spinner.classList.add("d-none");
            if (xhr.status === 200) {
                status.innerHTML = "✅ Products imported successfully!";
                status.classList.add("text-success");
            } else {
                status.innerHTML = "❌ Import failed!";
                status.classList.add("text-danger");
            }
        }
    };
    let url = "http://localhost:8080/pixelmart/fc/importprods";
    xhr.open("GET", url, true);

    xhr.send(null);
};

// Category Dropdown for Navbar
function loadCategoriesDropdown() {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jarr = JSON.parse(xhr.responseText);
                let html = "";
                jarr.forEach(obj => {
                    html +=
                            `<li>
                                <a class="dropdown-item" href="prodcat?catid=${obj.id}">
                                    ${obj.name}
                                </a>
                            </li>`;
                });
                document.getElementById("categoryMenu").innerHTML = html;
            }
        }
    };

    xhr.open("GET", "http://localhost:8080/pixelmart/fc/prodcat?type=json", true);
    xhr.send(null);
}

let showSubcategoryCards = function (catid) {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jarr = JSON.parse(xhr.responseText);
                let cards = jarr.map((obj, index) => React.createElement(
                            "div",
                            {
                                className: "col-lg-4 col-md-6 mb-4",
                                key: index
                            },
                            React.createElement(
                                    "a",
                                    {
                                        href: `prodcat?type=data&subcatid=${obj.id}`,
                                        className: "text-decoration-none"
                                    },
                                    React.createElement(
                                            "div",
                                            {
                                                className: "subcategory-card"
                                            },
                                            React.createElement(
                                                    "div",
                                                    {
                                                        className: "subcategory-title"
                                                    },
                                                    obj.name
                                                    ),
                                            React.createElement(
                                                    "div",
                                                    {
                                                        className: "subcategory-desc"
                                                    },
                                                    "Browse products, explore collections and discover top brands."
                                                    ),
                                            React.createElement(
                                                    "div",
                                                    {
                                                        className: "subcategory-footer"
                                                    },
                                                    React.createElement(
                                                            "span",
                                                            {
                                                                className: "subcategory-link"
                                                            },
                                                            "Explore Collection"
                                                            ),
                                                    React.createElement(
                                                            "div",
                                                            {
                                                                className: "arrow-circle"
                                                            },
                                                            React.createElement(
                                                                    "i",
                                                                    {
                                                                        className: "bi bi-arrow-right"
                                                                    }
                                                            )
                                                            )
                                                    )
                                            )
                                    )
                            )
                );
                let container = React.createElement(
                        "div",
                        {
                            className: "row"
                        },
                        cards
                        );

                ReactDOM.render(container, document.getElementById("subcategoryContainer"));
            }
        }
    };
    xhr.open("GET", `http://localhost:8080/pixelmart/fc/prodsubcat?catid=${catid}&type=json`, true);
    xhr.send(null);
};