ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Pourcentage de bonne réponse du bot" do
          pie_chart UserFeedback.group(:is_correct).count

          end
        end
        column do
          panel "Nombre de Feedback des utilisateurs" do
            line_chart UserFeedback.group_by_day(:date).count

            end
          end
      end
      columns do
        column do
          panel "Nombre de questions auxquels réponds le bot" do
              line_chart Intent.group_by_day(:created_at).count
            end
          end
          column do
            panel "Nombre moyen d'utterances pour chaque intent" do
              utterance = Utterance.group_by_day(:created_at).count
              intent = Intent.group_by_day(:created_at).count
              result = Hash.new
              utterance.keys.each do |i|
                utterance[i] = utterance[i]*1.0 / intent[i]
              end
                line_chart utterance
            end
          end
        end
    end
end
