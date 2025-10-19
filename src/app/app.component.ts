import { Component, ViewChild } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ButtonComponent } from "./button/button.component";
import { FormComponent } from "./form/form.component";
import { NgIf } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, ButtonComponent, FormComponent, NgIf],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Hello DevOps World 🌎';
  name = '';

  @ViewChild(FormComponent) formComponent!: FormComponent;

  onButtonClick(){
    this.name = this.formComponent.name;
    this.formComponent.name = "";
  }
}
