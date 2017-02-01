ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Pourcentage de bonne réponse du bot" do
          pie_chart UserFeedback.group(:is_correct).count.transform_keys{ |key| key == true ? "Bonnes réponses" : "Mauvaises réponses" }
        end
      end
      column do
        panel "Nombre de Feedback des utilisateurs" do
          line_chart UserFeedback.group_by_day_and_sum(:date)
        end
      end
    end
    columns do
      column do
        panel "Nombre de questions auxquels réponds le bot" do
          line_chart Intent.group_by_day_and_sum(:created_at)
        end
      end
      column do
        panel "Nombre moyen d'utterances pour chaque intent" do
          line_chart Utterance.get_ratio_with_intent
        end
      end
    end
  end
end
